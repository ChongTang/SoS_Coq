Require Import String.
Open Scope string_scope.
Require Export util.
Require Export core_config.
Require Export mapred_config.
Require Export hdfs_config.
Require Export yarn_config.
Require Export resource_mgr.

(*
Here we define a Hadoop configuration. It's a compound system built based on sub-components.
It also contains a few dependent types and constrains.
*)
Record HadoopConfig (total_cpu: nat) (total_phy_mem: nat)
  := mk_hadoop_config {
     resource_mgr: ResourceManager
    ;rm_config: (rm_config_type resource_mgr)
    ;mapred_config: (MapRedConfig total_cpu total_phy_mem)
    ;core_config: HadoopCoreConfig
    ;hdfs_config: HDFSConfig
}.