import pandas as pd
import random
import sys

param_valus = {}
param_module = {}
param_mtype = {}
param_ntype = {}
option_type = {}

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
    # if 'opt' in machine_type.lower():
    #     return 'string'
    if 'pos' in machine_type:
        return 'positive'
    if 'float' in machine_type.lower():
        return 'R'
    return machine_type


# select values in the param_valus dictionary and create configurations
def gen_a_conf_randomly(param_valus):
    '''
    Generating all possible configurations is impossible since there are huge
    number of configurations. For example, there will be
    739949452417931752279400825500488281250000000000000000000000000000000
    configurations for Hadoop.

    So a better way is to randomly generate a particular number of configurations.
    '''
    conf = {}
    for p, vs in param_valus.iteritems():
        conf[p] = random.choice(vs)
    return conf


def generate_a_coq_conf():
    return None


def create_coq_format_from_dict(index, conf, param_module):
    need_postfix = set(['positive', 'N', 'Z', 'R'])
    file_content = '''Require Import hadoop_config.
Require Import Reals.
Open Scope R_scope.
Require Import Omega.

'''
    core_module = '''Definition a_core_config: CoreConfig.
Proof.
unshelve refine (
    mk_core_config
'''
    hdfs_module = '''Definition a_hdfs_config: HDFSConfig.
Proof.
unshelve refine (
    mk_hdfs_config
'''
    mapred_module = '''Definition a_mapred_config: MapRedConfig.
Proof.
unshelve refine (
    mk_mapred_config
'''
    yarn_module = '''Definition a_yarn_config: YarnConfig.
Proof.
unshelve refine (
    mk_yarn_config
'''
    #############################################
    modules = list(set(param_module.values()))
    params = conf.keys()
    module_params = {'core':[], 'hdfs': [], 'mapred': [], 'yarn': []}
    for p in params:
        m = param_module[p].lower().strip()
        v = conf[p]
        if p in option_type:
            opt_type = option_type.get(p)
            if 'pos' in opt_type and int(v) > 0:
                v = '(Some ' + v + '%positive)'
            else:
                v = 'None'
        elif param_ntype[p] == 'string':
            v = '"' +v+ '"'
        elif param_ntype[p] == 'R':
            v = '(' + str(float(v)*100).split('.')[0] +'/100)%R'
        elif param_ntype[p] == 'N':
            v = v + '%N'
        elif param_ntype[p] == 'positive':
            v = v + '%positive'
        elif param_ntype[p] == 'Z':
            v = '(' + v + ')%Z'
        elif param_ntype[p] == 'JavaOpts':
            # parse number in java opts
            mem_num = v[4:-1]
            v = '(mk_java_opts ' + mem_num + '%positive 100%positive)'
        

        p_in_coq = p.replace('.', '_').replace('-', '__')

        if 'core' in m:
            module_params['core'].append((p_in_coq, v))
        elif 'hdfs' in m:
            module_params['hdfs'].append((p_in_coq, v))
        elif 'mapred' in m:
            module_params['mapred'].append((p_in_coq, v))
        elif 'yarn' in m:
            module_params['yarn'].append((p_in_coq, v))

    for module, pvs in module_params.iteritems():
        sorted_pvs = sorted(pvs, key=lambda x: x[0])
        module_str = ''
        for p, v in sorted_pvs:
            module_str += '    (' + p + '.mk false '+ v + ' _ )\n'

        if module == 'core':
            core_module += module_str
        elif module == 'hdfs':
            hdfs_module += module_str
        elif module == 'mapred':
            mapred_module += module_str
        elif module == 'yarn':
            yarn_module += module_str

    #############################################
    core_module += '''); try (exact I); try compute; auto.
Defined.

'''
    hdfs_module += '''); try (exact I).
Defined.

'''
    mapred_module += '''      _
    _
    _
    _
    _
); try (exact I); simpl; try (intro H); try (inversion H); try compute; try reflexivity; auto.
Defined.

'''
    yarn_module += '''      _
      _
      _
); try (exact I); compute; try reflexivity; auto.
Defined.
'''

    file_content += '\n'.join([core_module, hdfs_module, mapred_module, yarn_module])

    file_content += '''
    Definition a_hadoop_config: HadoopConfig.
    Proof.
     unshelve refine (
      mk_hadoop_config
        a_yarn_config
        a_mapred_config
        a_core_config
        a_hdfs_config
        _
        _
    ); try (exact I); simpl; omega.
    Defined.
    '''
    return file_content



xlsx_file = 'Hadoop_params_real_world_type.xlsx'
xlsx_file = sys.argv[1]
# read parameters and all values
df = pd.read_excel(xlsx_file, header=0)
for index, row in df.iterrows():
    param = row['Parameter'].strip()
    default_value = [str(row['Default']).strip()]
    alt_values = row['AltValues']
    alt_values = alt_values.strip().split(',')
    alt_values = [str(v).strip() for v in alt_values]
    all_values = default_value
    all_values.extend(alt_values)
    param_valus[param] = all_values
    module = row['Subcomponent']
    module = module.strip().split('-')[0]
    param_module[param] = module
    machine_type = row['Machine_Type']
    machine_type = unify_machine_type(param, machine_type)
    native_type = get_native_type(machine_type)
    param_mtype[param] = machine_type
    param_ntype[param] = native_type
    opt_type = str(row['OptionType']).strip()
    if opt_type.startswith('option'):
        option_type[param] = opt_type.strip()


# how many configurations to generate randomly
max_num = int(sys.argv[2])
conf_index = 1
while(conf_index <= max_num):
    a_conf = gen_a_conf_randomly(param_valus)
    # create Coq representation of configurations
    coq_string = create_coq_format_from_dict(conf_index, a_conf, param_module)
    with open('conf'+str(conf_index)+'.v', 'w') as fp:
        fp.write(coq_string)
    conf_index += 1

print 'Done!'
