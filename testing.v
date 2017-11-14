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
Require Import hadoop_config.

(*make a float number 0.5*)
Definition float1 := mk_float 0 5.
(*make a float number 1.2*)
Definition float2 := mk_float 1 2.
(*make a range value 0-2*)
Definition range1 := mk_range 0 2.
(*make a java opts value -Xmx2000M*)
Definition java_opts1 := mk_java_opts "-Xmx" 2000 "M". 

(*define a configuation for MapReduce sub-component*)
Definition mapred_config1 := mk_mapred_config
  env_condition1 java_opts1 "None" 
  true 0 (* this 0 depents on the previous true*)
  0 0 0 0 0 0 0
  float1
  0 0 0 0 0 0 0
  float2 float2
  0 "None" 
  0 0 0 0 0 0 0
  java_opts1
  0 0 
  false I
  0 true float1 false
  true "compress-code" "compress-type" 
  0 float1 java_opts1
  float2 0 0 0 0 0
  float1 float1 float2
  0 0 0 0 0 0 0 0 0 
  range1 "task-profile"
  0 0 0 0 0.

(*define a configuation for HDFS sub-component*)
Definition hdfs_config1 := mk_hdfs_config
  env_condition1 0 0.

(*define a configuation for CORE sub-component*)
Definition core_config1 := mk_hadoop_core_config
  env_condition1 "compress-code" 0 0 0 0 0 0.


(*define a configuation for CORE sub-component*)
Definition yarn_config1 := mk_yarn_config
  env_condition1 java_opts1
  0 0 0 0 0 0 0 0 0 0 0 
  true true true
  0 0 0 0
  "scheduler" 0
  "store-class"
  0 0 0 0 0
  true 0 0.

Definition other_rm_config1 := mk_other_rm_config env_condition1 0.

(*
Now we are able to define a full hadoop configuration given multiple 
configurations for sub-components.

Here the resource manager is Yarn, so we provide yarn_config1 here.
*)
Definition hadoop_config1 := mk_hadoop_config 
  env_condition1 
  Yarn yarn_config1 
  mapred_config1
  core_config1
  hdfs_config1.

(*Define another hadoop configuation with OtherRM as the resouce manager, 
 so we provide other_rm_config1 as its configuration.
*)
Definition hadoop_config2 := mk_hadoop_config 
  env_condition1 
  OtherRM other_rm_config1
  mapred_config1
  core_config1
  hdfs_config1.
