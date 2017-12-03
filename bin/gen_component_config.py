import pandas as pd
import sys

def unify_machine_type(input_type):
    input_type = input_type.lower().strip()
    if 'nature' in input_type or 'integer' in input_type:
        return 'integer'
    return input_type

def build_entry(pname_dots, pname_underscore, machine_type):
    res = ''
    res += 'Module ' + pname_underscore +'_desc <: FieldModuleType.\n'
    res += '  Definition fName := "' + pname_dots +'".\n'
    res += '  Definition mTipe := mTipe_' + machine_type + '.\n'
    res += '  Definition rType := fun value: ' + machine_type + ' => True.\n'
    res += 'End ' + pname_underscore + '_desc.\n'
    res += 'Module ' + pname_underscore + ' := FieldModuleFunctor ' + pname_underscore + '_desc.\n'
    res += 'Export ' + pname_underscore + '.\n'
    return res

def get_record_name(comp_name):
    if 'core' in comp_name:
        return 'core_config'
    if 'hdfs' in comp_name:
        return 'hdfs_config'
    if 'mapred' in comp_name:
        return 'mapred_config'
    if 'yarn' in comp_name:
        return 'yarn_config'

def build_entry2(conf_to_params):
    '''
    ====
    Require Export core_config_fields.

    Record hadoop_core_config := mk_hadoop_core_config {
        (* configuration file field names and types *)
        io_compression_codecs:  io_compression_codecs.ftype
      ; io_file_buffer_size :           io_file_buffer_size.ftype
      ; io_map_index_interval:     io_map_index_interval.ftype
    }.
    ====
    '''
    entries = []
    config_files = ['core-site.xml', 'hdfs-site.xml', 'mapred-site.xml', 'yarn-site.xml']
    for c in config_files:
        params = conf_to_params[c]
        record_name = get_record_name(c)
        entry = ''
        entry += 'Require Export ' + record_name + '_fields.\n\n'
        entry += 'Record ' + record_name + ' := mk_' + record_name + ' {\n'
        param_section = ''
        for p in params:
            param_section += ' ;' + p + ': ' + p + '.ftype\n'
        param_section = '  ' + param_section[2:]
        entry += param_section
        entry += '}.\n'
        entries.append(entry)
    return entries

# excel_file = "Hadoop_real_world_type.xlsx"
# excel_file = "Hadoop_params_real_world_type.xlsx"
excel_file = sys.argv[1]
all_entries = dict() # from configuration file to [parmas]

df = pd.read_excel(excel_file, header=0)

for ri, row in df.iterrows():
    pname_dots = row['Parameter']
    pname = pname_dots.replace('.', '_')
    pname = pname.replace('-', '__')
    conf_file = row['Subcomponent'].lower().strip()
    # print pname_dots, conf_file, machine_type
    if conf_file in all_entries:
        all_entries[conf_file].append(pname)
    else:
        all_entries[conf_file] = [pname]

entries = build_entry2(all_entries)
second_script = 'mk_config.v'
with open(second_script, 'w') as fp:
    for e in entries:
        fp.write(e + '\n\n')

print 'Done!'

# # create a list of parameters
# config_files = ['core-site.xml', 'hdfs-site.xml', 'mapred-site.xml', 'yarn-site.xml']
# for c in config_files:
#     params = all_entries[c]
#     print '===========', c, '==========='
#     print '===========', c, '==========='
#     for p in params:
#         print '('+p+'.mk            false   % _ )'



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
