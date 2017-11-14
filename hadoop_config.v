Require Import String.
Open Scope string_scope.
Require Import util.
Require Import env_condition.
Require Import core_config.
Require Import mapred_config.
Require Import hdfs_config.
Require Import yarn_config.
Require Import other_rm.
Require Import resource_mgr.

(*
Here we define a Hadoop configuration. It's a compound system built based on sub-components.
It also contains a few dependent types and constrains.
*)
Record HadoopConfig (cdt: ENVCondition):= mk_hadoop_config {
   resource_mgr: ResourceManager
  ;rm_config: rm_config_type cdt resource_mgr
  ;mapred_config: MapRedConfig cdt
  ;core_config: HadoopCoreConfig cdt
  ;hdfs_config: HDFSConfig cdt
}.