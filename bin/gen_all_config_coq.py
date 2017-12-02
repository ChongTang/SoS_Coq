import pandas as pd
import random
import sys

param_valus = {}
param_module = {}
param_mtype = {}
param_ntype = {}

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

'''
    core_module = '''Definition a_core_config: CoreConfig.
Proof.
refine (
    mk_core_config
'''
    hdfs_module = '''Definition a_hdfs_config: HDFSConfig.
Proof.
refine (
    mk_hdfs_config
'''
    mapred_module = '''Definition a_mapred_config: MapRedConfig.
Proof.
refine (
    mk_mapred_config
'''
    yarn_module = '''Definition a_yarn_config: YarnConfig.
Proof.
refine (
    mk_yarn_config
'''
    #############################################
    modules = list(set(param_module.values()))
    params = conf.keys()
    for p in params:
        m = param_module[p].lower().strip()
        v = conf[p]
        if param_ntype[p] == 'string':
            v = '"' +v+ '"'
        elif param_ntype[p] == 'R':
            v = '(' + str(float(v)*100).split('.')[0] +'/100)%R'
        elif param_ntype[p] == 'N':
            v = v + '%N'
        elif param_ntype[p] == 'positive':
            v = v + '%positive'
        elif param_ntype[p] == 'Z':
            v = v + '%Z'
        p = p.replace('.', '_').replace('-', '__')
        p = '  (' + p + '.mk false '+ v + ' _ )'
        if 'core' in m:
            core_module += '    ' + p + '\n'
        elif 'hdfs' in m:
            hdfs_module += '    ' + p + '\n'
        elif 'mapred' in m:
            mapred_module += '    ' + p + '\n'
        elif 'yarn' in m:
            yarn_module += '    ' + p + '\n'

    #############################################
    core_module += '''); try (exact I).
Qed.

'''
    hdfs_module += '''); try (exact I).
Qed.

'''
    mapred_module += '''      _
);try (exact I); simpl; try compute; try reflexivity; auto.
Qed.

'''
    yarn_module += '''      _
      _
      _
); try (exact I); compute; try reflexivity.
Qed.
'''

    file_content += '\n'.join([core_module, hdfs_module, mapred_module, yarn_module])
    file_content += '''
Definition a_hadoop_config := mk_hadoop_config myEnv
    a_yarn_config
    a_mapred_config
    a_core_config
    a_hdfs_config.
'''
    return file_content



xlsx_file = 'Hadoop_params_real_world_type.xlsx'

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


# how many configurations to generate randomly
max_num = int(sys.argv[1])
conf_index = 1
while(conf_index <= max_num):
    a_conf = gen_a_conf_randomly(param_valus)
    # create Coq representation of configurations
    coq_string = create_coq_format_from_dict(conf_index, a_conf, param_module)
    with open('conf'+str(conf_index)+'.v', 'w') as fp:
        fp.write(coq_string)
    conf_index += 1

print 'Done!'
