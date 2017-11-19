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

(*define a configuation for MapReduce sub-component*)
Definition mapred_config1 := mk_mapred_config total_cpu total_mem 
  java_opts1        (* mapred_child_java_opts: JavaOpts *)
  "None"            (* mapred_map_output_compression_type: string *)
  true              (* mapreduce_ifile_readahead: bool *)
  0                 (* mapreduce_ifile_readahead_bytes: if (mapreduce_ifile_readahead) then nat else True *)
  0                 (* mapreduce_input_fileinputformat_split_maxsize: nat *)
  0                 (* mapreduce_input_fileinputformat_split_minsize: nat *)
  0                 (* mapreduce_input_lineinputformat_linespermap: nat *)
  0                 (* mapreduce_job_counters_max: nat *)
  0                 (* mapreduce_job_jvm_numtasks: nat *)
  0                 (* mapreduce_job_maps: nat *)
  0                 (* mapreduce_job_max_split_locations: nat *)
  float1            (* mapreduce_job_reduce_slowstart_completedmaps: Float *)
  0                 (* mapreduce_job_reducer_unconditional__preempt_delay_sec: nat *)
  0                 (* mapreduce_job_reduces: nat *)
  0                 (* mapreduce_job_running_map_limit: nat *)
  0                 (* mapreduce_job_running_reduce_limit: nat *)
  0                 (* mapreduce_job_speculative_minimum__allowed__tasks: nat *)
  0                 (* mapreduce_job_speculative_retry__after__no__speculate: nat *)
  0                 (* mapreduce_job_speculative_retry__after__speculate: nat *)
  float2            (* mapreduce_job_speculative_speculative__cap__running__tasks: Float *)
  float2            (* mapreduce_job_speculative_speculative__cap__total__tasks: Float *)
  0                 (* mapreduce_job_split_metainfo_maxsize: nat *)
  "None"            (* mapreduce_job_ubertask_enable: string *)
  0                 (* mapreduce_job_ubertask_maxmaps: nat *)
  0                 (* mapreduce_job_ubertask_maxreduces: nat *)
  0                 (* mapreduce_jobtracker_expire_trackers_interval: nat *)
  0                 (* mapreduce_jobtracker_handler_count: nat *)
  0                 (* mapreduce_jobtracker_maxtasks_perjob: nat *)
  0                 (* mapreduce_jobtracker_taskcache_levels: nat *)
  0                 (* mapreduce_map_cpu_vcores: nat *)
  java_opts1        (* mapreduce_map_java_opts: JavaOpts *)
  0                 (* mapreduce_map_maxattempts: nat *)
  0                 (* mapreduce_map_memory_mb: nat *)
  false             (* mapreduce_map_output_compress: bool *)
  I                 (* mapreduce_map_output_compress_codec: if (mapreduce_map_output_compress) then string else True *)
  0                 (* mapreduce_map_skip_maxrecords: nat *)
  true              (* mapreduce_map_skip_proc_count_autoincr: bool *)
  float1            (* mapreduce_map_sort_spill_percent: Float *)
  false             (* mapreduce_map_speculative: bool *)
  true              (* mapreduce_output_fileoutputformat_compress: bool *)
  "compress-code"   (* mapreduce_output_fileoutputformat_compress_codec: if (mapreduce_output_fileoutputformat_compress) then string else True *)
  "compress-type"   (* mapreduce_output_fileoutputformat_compress_type: if (mapreduce_output_fileoutputformat_compress) then string else True *)
  0                 (* mapreduce_reduce_cpu_vcores: nat *)
  float1            (* mapreduce_reduce_input_buffer_percent: Float *)
  java_opts1        (* mapreduce_reduce_java_opts: JavaOpts *)
  float2            (* mapreduce_reduce_markreset_buffer_percent: Float *)
  0                 (* mapreduce_reduce_maxattempts: nat *)
  0                 (* mapreduce_reduce_memory_mb: nat *)
  0                 (* mapreduce_reduce_merge_inmem_threshold: nat *)
  0                 (* mapreduce_reduce_shuffle_fetch_retry_interval__ms: nat *)
  0                 (* mapreduce_reduce_shuffle_fetch_retry_timeout__ms: nat *)
  float1            (* mapreduce_reduce_shuffle_input_buffer_percent: Float *)
  float1            (* mapreduce_reduce_shuffle_memory_limit_percent: Float *)
  float2            (* mapreduce_reduce_shuffle_merge_percent: Float *)
  0                 (* mapreduce_reduce_shuffle_parallelcopies: nat *)
  0                 (* mapreduce_reduce_shuffle_retry__delay_max_ms: nat *)
  0                 (* mapreduce_shuffle_max_connections: nat *)
  0                 (* mapreduce_shuffle_max_threads: nat *)
  0                 (* mapreduce_shuffle_transfer_buffer_size: nat *)
  0                 (* mapreduce_task_combine_progress_records: nat *)
  0                 (* mapreduce_task_io_sort_factor: nat *)
  0                 (* mapreduce_task_io_sort_mb: nat *)
  0                 (* mapreduce_task_merge_progress_records: nat *)
  range1            (* mapreduce_task_profile_maps: Range *)
  "task-profile"    (* mapreduce_task_profile_reduces: string *)
  0                 (* mapreduce_tasktracker_http_threads: nat *)
  0                 (* mapreduce_tasktracker_indexcache_mb: nat *)
  0                 (* mapreduce_tasktracker_map_tasks_maximum: nat *)
  0                 (* mapreduce_tasktracker_reduce_tasks_maximum: nat *)
  0                 (* mapreduce_tasktracker_taskmemorymanager_monitoringinterval: nat *)

  (*
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
  *)
.

(*
  Question: How can we provide proofs for MapRedConfig as needed,
  but not named proofs. 
  Because we don't know the value of cpu cores before definition.
*)

(*define a configuation for HDFS sub-component*)
Definition hdfs_config1 := mk_hdfs_config 
  0                 (* dfs_namenode_handler_count: nat *)
  0.                (* dfs_replication: nat *)

(*define a configuation for CORE sub-component*)
Definition core_config1 := mk_hadoop_core_config
  "compress-code"   (* io_compression_codecs: string *)
  0                 (* io_file_buffer_size: nat *) 
  0                 (* io_map_index_interval: nat *)
  0                 (* io_map_index_skip: nat *)
  0                 (* io_seqfile_compress_blocksize: nat *)
  0                 (* io_seqfile_sorter_recordlimit: nat*)
  0.                (* ipc_maximum_data_length: nat *)


(*define a configuation for CORE sub-component*)
Definition yarn_config1 := mk_yarn_config
  java_opts1        (* yarn_app_mapreduce_am_command__opts: JavaOpts *)
  0                 (* yarn_app_mapreduce_am_containerlauncher_threadpool__initial__size: nat *)
  0                 (* yarn_app_mapreduce_am_job_task_listener_thread__count: nat *)
  0                 (* yarn_app_mapreduce_am_resource_cpu__vcores: nat *)
  0                 (* yarn_app_mapreduce_am_resource_mb: nat *)
  0                 (* yarn_nodemanager_container__manager_thread__count: nat *)
  0                 (* yarn_nodemanager_localizer_client_thread__count: nat *)
  0                 (* yarn_nodemanager_localizer_fetch_thread__count: nat *)
  0                 (* yarn_nodemanager_recovery_compaction__interval__secs: nat *)
  0                 (* yarn_nodemanager_resource_cpu__vcores: nat *)
  0                 (* yarn_nodemanager_resource_memory__mb: nat *)
  0                 (* yarn_nodemanager_resource_percentage__physical__cpu__limit: nat (*100 means 100%*) *)
  true              (* yarn_nodemanager_vmem__check__enabled: bool *)
  true              (* yarn_nodemanager_windows__container_cpu__limit_enabled: bool *)
  true              (* yarn_nodemanager_windows__container_memory__limit_enabled: bool *)
  0                 (* yarn_resourcemanager_admin_client_thread__count: nat  *)
  0                 (* yarn_resourcemanager_amlauncher_thread__count: nat *)
  0                 (* yarn_resourcemanager_client_thread__count: nat *)
  0                 (* yarn_resourcemanager_resource__tracker_client_thread__count: nat *)
  "scheduler"       (* yarn_resourcemanager_scheduler_class: string *)
  0                 (* yarn_resourcemanager_scheduler_client_thread__count: nat *)
  "store-class"     (* yarn_resourcemanager_store_class: string *)
  0                 (* yarn_scheduler_increment__allocation__mb: nat *)
  0                 (* yarn_scheduler_maximum__allocation__mb: nat *)
  0                 (* yarn_scheduler_maximum__allocation__vcores: nat *)
  0                 (* yarn_scheduler_minimum__allocation__mb: nat *)
  0                 (* yarn_scheduler_minimum__allocation__vcores: nat *)
  true              (* yarn_sharedcache_enabled: bool *)
  0                 (* yarn_sharedcache_admin_thread__count: if (yarn_sharedcache_enabled) then nat else True *)
  0.                (* yarn_sharedcache_client__server_thread__count: if (yarn_sharedcache_enabled) *)

(*
Now we are able to define a full hadoop configuration given multiple 
configurations for sub-components.

Here the resource manager is Yarn, so we provide yarn_config1 here.
*)

(*I have difficult to provide a proof for constraints in MapRedConfig*)
Definition hadoop_config1 := mk_hadoop_config 
  total_cpu         (* total_cpu: nat *) 
  total_mem         (* total_phy_mem: nat *)
  Yarn              (* resource_mgr: ResourceManager *)
  yarn_config1      (* rm_config_type resource_mgr *)
  mapred_config1    (* mapred_config: (MapRedConfig total_cpu total_phy_mem) *)
  core_config1      (* core_config: HadoopCoreConfig *)
  hdfs_config1.     (* hdfs_config: HDFSConfig *)

