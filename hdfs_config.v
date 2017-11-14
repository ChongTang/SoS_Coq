Require Import String.
Open Scope string_scope.
Require Import util.
Require Import env_condition.

(*Configuration for HDFS sub-component*)
Record HDFSConfig (cdt: ENVCondition) := mk_hdfs_config {
   dfs_namenode_handler_count: nat
  ;dfs_replication: nat
}.