Require Import String.
Open Scope string_scope.
Require Export util.

(*Configuration for HDFS sub-component*)
Record HDFSConfig := mk_hdfs_config {
   dfs_namenode_handler_count: nat
  ;dfs_replication: nat
}.