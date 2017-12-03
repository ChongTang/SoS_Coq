# How to run scripts:

__Warning__: These scripts will overwrite the old .v files.

1. gen_fileds.py creates Hadoop fields in required Coq format. The output of this scripts includes four Coq .v files: core_config.v, hdfs_config.v, mapred_config.v, and yarn_config.v.

 ```
 python gen_fileds.py Hadoop_params_real_world_type.xlsx
 ```

2. gen_config.py creates Coq Record for Hadoop sub-components. The output will be a single mk_config.v file.

 ```
 python gen_fileds.py Hadoop_params_real_world_type.xlsx
 ```

3. _gen_all_config_coq.py_ randomly generate N configurations in Coq's format and write them into multiple disk files. The N is an argument.

   ```
   python gen_all_config_coq.py Hadoop_params_real_world_type.xlsx 1
   ```
   This command will generate a single configuration: conf1.v
