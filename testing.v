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
Definition java_opts1 := mk_java_opts 20 M. 

Definition total_cpu := 2.
Definition total_mem := 200.

(*
Chong: Please finish copying these field names and types as 
comments into the mapred_config1 definition, below, and then
similarly comment the other record definitions. This will make it
a whole lot easier to see what the individual field values are and
how to change them.

  ;mapreduce_job_split_metainfo_maxsize: nat
  ;mapreduce_job_ubertask_enable: string
  ;mapreduce_job_ubertask_maxmaps: nat
  ;mapreduce_job_ubertask_maxreduces: nat
  ;mapreduce_jobtracker_expire_trackers_interval: nat
  ;mapreduce_jobtracker_handler_count: nat
  ;mapreduce_jobtracker_maxtasks_perjob: nat
  ;mapreduce_jobtracker_taskcache_levels: nat
  ;mapreduce_map_cpu_vcores: nat
  ;mapreduce_map_java_opts: JavaOpts
  ;mapreduce_map_maxattempts: nat
  ;mapreduce_map_memory_mb: nat
  ;mapreduce_map_output_compress: bool
  ;mapreduce_map_output_compress_codec: if (mapreduce_map_output_compress) then string else True
  ;mapreduce_map_skip_maxrecords: nat
  ;mapreduce_map_skip_proc_count_autoincr: bool
  ;mapreduce_map_sort_spill_percent: Float
  ;mapreduce_map_speculative: bool
  ;mapreduce_output_fileoutputformat_compress: bool
  ;mapreduce_output_fileoutputformat_compress_codec: if (mapreduce_output_fileoutputformat_compress) then string else True
  ;mapreduce_output_fileoutputformat_compress_type: if (mapreduce_output_fileoutputformat_compress) then string else True
  ;mapreduce_reduce_cpu_vcores: nat
  ;mapreduce_reduce_input_buffer_percent: Float
  ;mapreduce_reduce_java_opts: JavaOpts
  ;mapreduce_reduce_markreset_buffer_percent: Float
  ;mapreduce_reduce_maxattempts: nat
  ;mapreduce_reduce_memory_mb: nat
  ;mapreduce_reduce_merge_inmem_threshold: nat
  ;mapreduce_reduce_shuffle_fetch_retry_interval__ms: nat
  ;mapreduce_reduce_shuffle_fetch_retry_timeout__ms: nat
  ;mapreduce_reduce_shuffle_input_buffer_percent: Float
  ;mapreduce_reduce_shuffle_memory_limit_percent: Float
  ;mapreduce_reduce_shuffle_merge_percent: Float
  ;mapreduce_reduce_shuffle_parallelcopies: nat
  ;mapreduce_reduce_shuffle_retry__delay_max_ms: nat
  ;mapreduce_shuffle_max_connections: nat
  ;mapreduce_shuffle_max_threads: nat
  ;mapreduce_shuffle_transfer_buffer_size: nat
  ;mapreduce_task_combine_progress_records: nat
  ;mapreduce_task_io_sort_factor: nat
  ;mapreduce_task_io_sort_mb: nat
  ;mapreduce_task_merge_progress_records: nat
  ;mapreduce_task_profile_maps: Range
  ;mapreduce_task_profile_reduces: string
  ;mapreduce_tasktracker_http_threads: nat
  ;mapreduce_tasktracker_indexcache_mb: nat 
  ;mapreduce_tasktracker_map_tasks_maximum: nat
  ;mapreduce_tasktracker_reduce_tasks_maximum: nat
  ;mapreduce_tasktracker_taskmemorymanager_monitoringinterval: nat

  (*some restrictions from environment conditions
  *first restriction: map CPU cores should less than total CPU cores.
  *)
  ;map_cpu_core_le_total_cores: mapreduce_map_cpu_vcores < total_cpu
  ;map_mem_le_total_mem: mapreduce_map_memory_mb < total_phy_mem

  (*
  We can also define some constraints among parameters (internal constraints)*
  *The first constraint is that the java heap space should be less than the memory for map tasks
  *)
  ;map_java_opts_le_map_mem: heap_size mapreduce_map_java_opts < mapreduce_map_memory_mb
}.
*)

(*define a configuation for MapReduce sub-component*)
Definition mapred_config1 := mk_mapred_config total_cpu total_mem 
  java_opts1            (* mapred_child_java_opts: JavaOpts *)
  "None"                  (* mapred_map_output_compression_type: string *)
  true                       (* mapreduce_ifile_readahead: bool *)
  0                           (* mapreduce_ifile_readahead_bytes: if (mapreduce_ifile_readahead) then nat else True *)
  0                           (* mapreduce_input_fileinputformat_split_maxsize: nat *)
  0                           (* mapreduce_input_fileinputformat_split_minsize: nat *)
  0                           (* mapreduce_input_lineinputformat_linespermap: nat *)
  0                           (* mapreduce_job_counters_max: nat *)
  0                           (* mapreduce_job_jvm_numtasks: nat *)
  0                           (* mapreduce_job_maps: nat *)
  0                           (* mapreduce_job_max_split_locations: nat *)
 float1                     (* mapreduce_job_reduce_slowstart_completedmaps: Float *)
  0                           (* mapreduce_job_reducer_unconditional__preempt_delay_sec: nat *)
  0                           (* mapreduce_job_reduces: nat *)
  0                          (* mapreduce_job_running_map_limit: nat *)
  0                          (* mapreduce_job_running_reduce_limit: nat *)
  0                          (* mapreduce_job_speculative_minimum__allowed__tasks: nat *)
  0                          (* mapreduce_job_speculative_retry__after__no__speculate: nat *)
  0                          (* mapreduce_job_speculative_retry__after__speculate: nat *)
  float2                   (* mapreduce_job_speculative_speculative__cap__running__tasks: Float *)
  float2                   (* mapreduce_job_speculative_speculative__cap__total__tasks: Float *)
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

(*
  Question: How can we provide proofs for MapRedConfig as needed,
  but not named proofs. 
  Because we don't know the value of cpu cores before definition.
*)

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

(*I have difficult to provide a proof for constraints in MapRedConfig*)
Definition hadoop_config1 := mk_hadoop_config total_cpu total_mem
  Yarn yarn_config1 
  mapred_config1
  core_config1
  hdfs_config1.

