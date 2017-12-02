import pandas as pd
import sys

def unify_machine_type(p, input_type):
    input_type = input_type.lower().strip()
    if 'integer' in input_type:
        return 'Z'
    if 'nature' in input_type:
        return 'pos'
    if 'non-negative' in input_type:
        return 'N'
    if 'bool' in input_type:
        return 'bool'
    if 'opts' in p.lower() and 'string' in input_type.lower():
        return 'JavaOpts'
        # return 'string'
    return input_type

def get_native_type(machine_type):
    if 'opt' in machine_type.lower():
        return 'string'
    if 'pos' in machine_type:
        return 'positive'
    if 'float' in machine_type.lower():
        return 'R'
    return machine_type

def build_entry(pname_dots, pname_underscore, machine_type, coq_native_type):
    res = ''
    res += 'Module ' + pname_underscore +'_desc <: FieldModuleType.\n'
    res += '  Definition fName := "' + pname_dots +'".\n'
    res += '  Definition mTipe := mTipe_' + machine_type + '.\n'
    res += '  Definition rType := fun value: ' + coq_native_type + ' => True.\n'
    # res += '  Definition fUnit := noUnit.\n'
    res += '  Definition fUnit := "".\n'
    res += '  Definition fInterp := "".\n'
    res += '  Definition fAdvice := "".\n'
    res += 'End ' + pname_underscore + '_desc.\n'
    res += 'Module ' + pname_underscore + ' := FieldModuleFunctor ' + pname_underscore + '_desc.\n'
    res += 'Export ' + pname_underscore + '.\n'
    return res

'''
Example:

Module io_file_buffer_size_desc <: FieldModuleType.
  Definition fName := "io.file.buffer.size".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => Zmod_POS value (Zpos env_hw_page_size) = 0%Z.
  Definition fUnit := noUnit.
  Definition fInterp := "".
  Definition fAdvice := "".
End io_file_buffer_size_desc.
Module io_file_buffer_size := FieldModuleFunctor io_file_buffer_size_desc.
Export io_file_buffer_size.
'''

xlsx_file = sys.argv[1]
# excel_file = "Hadoop_real_world_type.xlsx"
# excel_file = "Hadoop_params_real_world_type.xlsx"
excel_file = xlsx_file
all_entries = dict() # from configuration file to ()

df = pd.read_excel(excel_file, header=0)

for ri, row in df.iterrows():
    pname_dots = row['Parameter']
    pname = pname_dots.replace('.', '_')
    pname = pname.replace('-', '__')
    conf_file = row['Subcomponent'].lower().strip()
    machine_type = row['Machine_Type']
    machine_type = unify_machine_type(pname, machine_type)
    native_type = get_native_type(machine_type)
    entry = build_entry(pname_dots, pname, machine_type, native_type)
    # print pname_dots, conf_file, machine_type
    if conf_file in all_entries:
        all_entries[conf_file].append(entry)
    else:
        all_entries[conf_file] = [entry]

conf_files = list(set(all_entries.keys()))
for cf in conf_files:
    entries = all_entries[cf]
    cf = cf.replace('.xml', '.v')
    with open(cf, 'w') as fp:
        for e in entries:
            fp.write(e + '\n\n')

print 'Done!'

'''
==== Here's the text to generate, but for required substitutions ====
Module io_compression_codecs_desc <: FieldModuleType.
  Definition fId := "io.compression.codecs".
  Definition mTipe := mTipe_string.
  Definition rType := fun s: string => True.
End io_compression_codecs_desc.
Module io_compression_codecs := FieldModuleFunctor io_compression_codecs_desc.
Export io_compression_codecs.
==== end ====


==== Here's the text to generate, but for required substitutions ====
Module <field_name_with_underscores>_desc <: FieldModuleType.
  Definition fId := "<field_name_with_dots>".
  Definition mTipe := mTipe_<machine_type>.
  Definition rType := fun value: <machine_type> => True.
End <field_name_with_underscores>_desc.
Module <field_name_with_underscores> := FieldModuleFunctor <field_name_with_underscores>_desc.
Export <field_name_with_underscores>.
==== end ====
'''
