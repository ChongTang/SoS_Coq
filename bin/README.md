# How to run scripts:

__Warning__: These scripts will overwrite the old .v files.

1. **gen_fileds.py** creates Hadoop fields in required Coq format. The output of this scripts includes four Coq .v files: core_config.v, hdfs_config.v, mapred_config.v, and yarn_config.v.

  ```
  python gen_fields.py Hadoop_params_real_world_type.xlsx
  ```

2. **gen_component_config.py** creates Coq Records for Hadoop sub-components. The output will be a single mk_config.v file.

  ```
  python gen_component_config.py Hadoop_params_real_world_type.xlsx
  ```

3. **gen_config_coq.py** randomly generate N configurations in Coq's format and write them into multiple disk files. The N is an argument.

  ```
  python gen_config_coq.py Hadoop_params_real_world_type.xlsx 1
  ```
  This command will generate a single configuration: conf1.v

4. **verify_conf.py** verify a given configuration in Coq format, which can be created with **gen_config_coq.py**.

 ```
 python verify_conf.py conf1.v $checker_home
 ```
 ,where the $checker_home is the home directory of the type checker.


**Wanna try it???**

To try to create a configuration and verify it with our checker, one can call **gen_config_coq.py** to create a configuration and then call **verify_conf.py** to verify it. For example:
```
# create a configuration
python gen_config_coq.py Hadoop_params_real_world_type.xlsx 1

# verify it, using the checker in "../deep" folder
python verify_conf.py conf1.v ../deep
```
