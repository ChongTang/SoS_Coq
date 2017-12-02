Require Import String.
Require Export Coq.ZArith.BinInt.
Open Scope string_scope.
Require Export util.

(*Configuration for HDFS sub-component*)
Record HDFSConfig := mk_hdfs_config {
   dfs_namenode_handler_count: Z
  ;dfs_replication: Z
}.