Require Import String.
Open Scope string_scope.

(*I define my own float type in Coq*)
Record Float := mk_float {
   before_dot: nat
  ;after_dot: nat
}.

Definition float1 := mk_float 0 5. (*make a float number 0.5*)
Definition float2 := mk_float 1 2. (*make a float number 1.2*)

(*A range value is like 0-2 and 3-5, which has two numbers before and after the dash*)
Record Range := mk_range {
   before_dash: nat
  ;after_dash: nat
}.

Definition range1 := mk_range 0 2. (*make a range value 0-2*)

(*
A Java opts is like -Xmx2000M. There are three parts:
1. prefix string: -Xmx
2. integer 2000
3. the unit: M
*)
Record JavaOpts := mk_java_opts {
   type: string (*like -Xmx*)
  ;number: nat  (* 2000 *)
  ;unit: string (*like M*)
}.

Definition java_opts1 := mk_java_opts "-Xmx" 2000 "M". (*make a java opts value -Xmx2000M*)

(*
The ENVCondition is environment condition type.
For now, it has two components: 
1. number of cpu cores
2. physical memory allocated to Hadoop.
*)
Record ENVCondition := mk_condition {
  total_cpu: nat
  ;total_phy_mem: nat  (*unit in M*)
}.

(*This machine has 8 cores and 10240M memory allocated to Hadoop*)
Definition env_condition1 := mk_condition 8 10240. 
Compute (total_cpu env_condition1).

(*Configuration for MapRed sub-component*)
Record MapRedConfig (cdt: ENVCondition) := mk_mapred_config {
   mapred_child_java_opts: JavaOpts
  ;mapred_map_output_compression_type: string
  ;mapreduce_ifile_readahead: bool
  ;mapreduce_ifile_readahead_bytes: if (mapreduce_ifile_readahead) then nat else True
  ;mapreduce_input_fileinputformat_split_maxsize: nat
  ;mapreduce_input_fileinputformat_split_minsize: nat
  ;mapreduce_input_lineinputformat_linespermap: nat
  ;mapreduce_job_counters_max: nat
  ;mapreduce_job_jvm_numtasks: nat
  ;mapreduce_job_maps: nat
  ;mapreduce_job_max_split_locations: nat
  ;mapreduce_job_reduce_slowstart_completedmaps: Float
  ;mapreduce_job_reducer_unconditional__preempt_delay_sec: nat
  ;mapreduce_job_reduces: nat
  ;mapreduce_job_running_map_limit: nat
  ;mapreduce_job_running_reduce_limit: nat
  ;mapreduce_job_speculative_minimum__allowed__tasks: nat
  ;mapreduce_job_speculative_retry__after__no__speculate: nat
  ;mapreduce_job_speculative_retry__after__speculate: nat
  ;mapreduce_job_speculative_speculative__cap__running__tasks: Float
  ;mapreduce_job_speculative_speculative__cap__total__tasks: Float
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
  *first restriction: map CPU cores should less than total CPU cores.*
  ;map_cpu_core_le_total_cores: mapreduce_map_cpu_vcores < total_cpu cdt
  ;map_mem_le_total_mem: mapreduce_map_memory_mb < total_phy_mem cdt

  *We can also define some constraints among parameters (internal constraints)*
  *The first constraint is that the java heap space should be less than the memory for map tasks*
  ;map_java_opts_le_map_mem: number mapreduce_map_java_opts < mapreduce_map_memory_mb *)
}.


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

Print mapred_config1.


(*Configuration for HDFS sub-component*)
Record HDFSConfig (cdt: ENVCondition) := mk_hdfs_config {
   dfs_namenode_handler_count: nat
  ;dfs_replication: nat
}.

(*define a configuation for HDFS sub-component*)
Definition hdfs_config1 := mk_hdfs_config
  env_condition1 0 0.


(*Configuration for Hadoop Core sub-component*)
Record HadoopCoreConfig (cdt: ENVCondition) := mk_hadoop_core_config {
   io_compression_codecs: string
  ;io_file_buffer_size: nat
  ;io_map_index_interval: nat
  ;io_map_index_skip: nat
  ;io_seqfile_compress_blocksize: nat
  ;io_seqfile_sorter_recordlimit: nat
  ;ipc_maximum_data_length: nat
}.

(*define a configuation for CORE sub-component*)
Definition core_config1 := mk_hadoop_core_config
  env_condition1 "compress-code" 0 0 0 0 0 0.


(*Configuration for YARN sub-component*)
Record YarnConfig (cdt: ENVCondition) := mk_yarn_config {
   yarn_app_mapreduce_am_command__opts: JavaOpts
  ;yarn_app_mapreduce_am_containerlauncher_threadpool__initial__size: nat
  ;yarn_app_mapreduce_am_job_task_listener_thread__count: nat
  ;yarn_app_mapreduce_am_resource_cpu__vcores: nat
  ;yarn_app_mapreduce_am_resource_mb: nat
  ;yarn_nodemanager_container__manager_thread__count: nat
  ;yarn_nodemanager_localizer_client_thread__count: nat
  ;yarn_nodemanager_localizer_fetch_thread__count: nat
  ;yarn_nodemanager_recovery_compaction__interval__secs: nat
  ;yarn_nodemanager_resource_cpu__vcores: nat
  ;yarn_nodemanager_resource_memory__mb: nat
  ;yarn_nodemanager_resource_percentage__physical__cpu__limit: nat (*100 means 100%*)
  ;yarn_nodemanager_vmem__check__enabled: bool
  ;yarn_nodemanager_windows__container_cpu__limit_enabled: bool
  ;yarn_nodemanager_windows__container_memory__limit_enabled: bool
  ;yarn_resourcemanager_admin_client_thread__count: nat 
  ;yarn_resourcemanager_amlauncher_thread__count: nat
  ;yarn_resourcemanager_client_thread__count: nat
  ;yarn_resourcemanager_resource__tracker_client_thread__count: nat
  ;yarn_resourcemanager_scheduler_class: string
  ;yarn_resourcemanager_scheduler_client_thread__count: nat
  ;yarn_resourcemanager_store_class: string
  ;yarn_scheduler_increment__allocation__mb: nat
  ;yarn_scheduler_maximum__allocation__mb: nat
  ;yarn_scheduler_maximum__allocation__vcores: nat
  ;yarn_scheduler_minimum__allocation__mb: nat
  ;yarn_scheduler_minimum__allocation__vcores: nat
  ;yarn_sharedcache_enabled: bool
  ;yarn_sharedcache_admin_thread__count: if (yarn_sharedcache_enabled) then nat else True
  ;yarn_sharedcache_client__server_thread__count: if (yarn_sharedcache_enabled) then nat else True
}.

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

(*Define another resource manager and suppose there is only one parameter "param1"*)
Record OtherRMConfig (cdt: ENVCondition) := mk_other_rm_config {
  param1: nat
}.
Definition other_rm_config1 := mk_other_rm_config env_condition1 0.

Inductive ResourceManager := Yarn | OtherRM.


Definition rm_config_type (cdt: ENVCondition) (rm: ResourceManager): Type :=
  match rm with
    | Yarn => YarnConfig cdt
    | OtherRM => OtherRMConfig cdt
  end.

(*
Here we define a Hadoop configuration. It's a compound system built based on sub-components.
It also contains a few dependent types and constrains.
*)
Record HadoopConfig := mk_hadoop_config {
   cdt: ENVCondition
  ;resource_mgr: ResourceManager
  ;rm_config: rm_config_type cdt resource_mgr
  ;mapred_config: MapRedConfig cdt
  ;core_config: HadoopCoreConfig cdt
  ;hdfs_config: HDFSConfig cdt
}.

(*Now we are able to define a full hadoop configuration given multiple configurations for sub-components.*)
(*Here the resource manager is Yarn, so we provide yarn_config1 here.*)
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