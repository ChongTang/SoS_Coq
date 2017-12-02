Require Import String.
Open Scope string_scope.
Require Export core_config.
Require Export mapred_config.
Require Export hdfs_config.
Require Export yarn_config.
Require Export env_desc.
Open Scope Z_scope.
Open Scope positive_scope.
Require Import Reals.
Open Scope R_scope.

(*
Here we define a Hadoop configuration. It's a compound system built based on sub-components.
It also contains a few dependent types and constrains.
*)
Record HadoopConfig (env: Env) := mk_hadoop_config {
  yarn_config: YarnConfig
 ;mapred_config: MapRedConfig
 ;core_config: CoreConfig
 ;hdfs_config: HDFSConfig
}.