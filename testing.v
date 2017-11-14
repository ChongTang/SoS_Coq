Require Import String.
Open Scope string_scope.
Require Import hadoop_config.

(*This machine has 8 cores and 10240M memory allocated to Hadoop
Definition env_condition1 := mk_condition 8 10240. 
Compute (total_cpu env_condition1).
*)

(*make a float number 0.5*)
Definition float1 := mk_float 0 5.
(*make a float number 1.2*)
Definition float2 := mk_float 1 2.
(*make a range value 0-2*)
Definition range1 := mk_range 0 2.
(*make a java opts value -Xmx2000M*)
Definition java_opts1 := mk_java_opts "-Xmx" 20 "M". 

Definition total_cpu := 2.
Definition total_mem := 200.

(*define a configuation for MapReduce sub-component*)
Definition mapred_config1 := mk_mapred_config
  total_cpu total_mem java_opts1 "None" 
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
Definition hdfs_config1 := mk_hdfs_config 0 0.

(*define a configuation for CORE sub-component*)
Definition core_config1 := mk_hadoop_core_config
  "compress-code" 0 0 0 0 0 0.


(*define a configuation for CORE sub-component*)
Definition yarn_config1 := mk_yarn_config
  java_opts1
  0 0 0 0 0 0 0 0 0 0 0 
  true true true
  0 0 0 0
  "scheduler" 0
  "store-class"
  0 0 0 0 0
  true 0 0.

(*
Now we are able to define a full hadoop configuration given multiple 
configurations for sub-components.

Here the resource manager is Yarn, so we provide yarn_config1 here.
*)
Definition hadoop_config1 := mk_hadoop_config total_cpu total_mem
  Yarn yarn_config1 
  mapred_config1
  core_config1
  hdfs_config1.

