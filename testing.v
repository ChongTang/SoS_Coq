Require Import String.
Open Scope string_scope.
Require Import Omega.
Require Import hadoop_config.

(*
Environment parameter values.
*)
Definition total_cpu := 2.
Definition total_mem := 200.


(*
Configuration parameter values.
*)
Definition my_mapreduce_map_cpu_vcores := 1.
Definition my_mapreduce_map_memory_mb := 21. (* changed this to satisfy constraint *)
Definition my_mapred_child_java_opts := mk_java_opts 20 M. 
Definition my_mapreduce_map_java_opts := mk_java_opts 20 M. 
Definition my_mapreduce_reduce_java_opts := mk_java_opts 20 M. 


(*
Configuration proofs of constraint integrity.
*)
Theorem mapreduce_map_cpu_vcores_le_total_cpu: 
                 my_mapreduce_map_cpu_vcores < total_cpu. 
Proof.
unfold my_mapreduce_map_cpu_vcores; unfold total_cpu; omega. 
Qed.

Theorem my_mapreduce_map_memory_mb_le_total_mem: 
                  my_mapreduce_map_memory_mb < total_mem.
Proof.
unfold my_mapreduce_map_memory_mb; unfold total_mem; omega.
Qed.

Theorem my_mapreduce_map_java_opts_lt_my_mapreduce_map_memory_mb:
                  heap_size my_mapreduce_map_java_opts < my_mapreduce_map_memory_mb.
simpl. unfold my_mapreduce_map_memory_mb. omega. Qed.

(*define a configuation for MapReduce sub-component*)
Definition mapred_config1 := mk_mapred_config total_cpu total_mem 
  my_mapred_child_java_opts        (* mapred_child_java_opts: JavaOpts *)
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
  (mk_float 0 5)            (* mapreduce_job_reduce_slowstart_completedmaps: Float *)
  0                 (* mapreduce_job_reducer_unconditional__preempt_delay_sec: nat *)
  0                 (* mapreduce_job_reduces: nat *)
  0                 (* mapreduce_job_running_map_limit: nat *)
  0                 (* mapreduce_job_running_reduce_limit: nat *)
  0                 (* mapreduce_job_speculative_minimum__allowed__tasks: nat *)
  0                 (* mapreduce_job_speculative_retry__after__no__speculate: nat *)
  0                 (* mapreduce_job_speculative_retry__after__speculate: nat *)
  (mk_float 1 2)            (* mapreduce_job_speculative_speculative__cap__running__tasks: Float *)
  (mk_float 1 2)            (* mapreduce_job_speculative_speculative__cap__total__tasks: Float *)
  0                 (* mapreduce_job_split_metainfo_maxsize: nat *)
  "None"            (* mapreduce_job_ubertask_enable: string *)
  0                 (* mapreduce_job_ubertask_maxmaps: nat *)
  0                 (* mapreduce_job_ubertask_maxreduces: nat *)
  0                 (* mapreduce_jobtracker_expire_trackers_interval: nat *)
  0                 (* mapreduce_jobtracker_handler_count: nat *)
  0                 (* mapreduce_jobtracker_maxtasks_perjob: nat *)
  0                 (* mapreduce_jobtracker_taskcache_levels: nat *)
  my_mapreduce_map_cpu_vcores         (* mapreduce_map_cpu_vcores: nat *)
  my_mapreduce_map_java_opts        (* mapreduce_map_java_opts: JavaOpts *)
  0                 (* mapreduce_map_maxattempts: nat *)
  my_mapreduce_map_memory_mb       (* mapreduce_map_memory_mb: nat *)
  false             (* mapreduce_map_output_compress: bool *)
  I                 (* mapreduce_map_output_compress_codec: if (mapreduce_map_output_compress) then string else True *)
  0                 (* mapreduce_map_skip_maxrecords: nat *)
  true              (* mapreduce_map_skip_proc_count_autoincr: bool *)
  (mk_float 0 5)            (* mapreduce_map_sort_spill_percent: Float *)
  false             (* mapreduce_map_speculative: bool *)
  true              (* mapreduce_output_fileoutputformat_compress: bool *)
  "compress-code"   (* mapreduce_output_fileoutputformat_compress_codec: if (mapreduce_output_fileoutputformat_compress) then string else True *)
  "compress-type"   (* mapreduce_output_fileoutputformat_compress_type: if (mapreduce_output_fileoutputformat_compress) then string else True *)
  0                 (* mapreduce_reduce_cpu_vcores: nat *)
  (mk_float 0 5)            (* mapreduce_reduce_input_buffer_percent: Float *)
  my_mapreduce_reduce_java_opts        (* mapreduce_reduce_java_opts: JavaOpts *)
  (mk_float 1 2)            (* mapreduce_reduce_markreset_buffer_percent: Float *)
  0                 (* mapreduce_reduce_maxattempts: nat *)
  0                 (* mapreduce_reduce_memory_mb: nat *)
  0                 (* mapreduce_reduce_merge_inmem_threshold: nat *)
  0                 (* mapreduce_reduce_shuffle_fetch_retry_interval__ms: nat *)
  0                 (* mapreduce_reduce_shuffle_fetch_retry_timeout__ms: nat *)
  (mk_float 0 5)            (* mapreduce_reduce_shuffle_input_buffer_percent: Float *)
  (mk_float 0 5)          (* mapreduce_reduce_shuffle_memory_limit_percent: Float *)
  (mk_float 1 2)            (* mapreduce_reduce_shuffle_merge_percent: Float *)
  0                 (* mapreduce_reduce_shuffle_parallelcopies: nat *)
  0                 (* mapreduce_reduce_shuffle_retry__delay_max_ms: nat *)
  0                 (* mapreduce_shuffle_max_connections: nat *)
  0                 (* mapreduce_shuffle_max_threads: nat *)
  0                 (* mapreduce_shuffle_transfer_buffer_size: nat *)
  0                 (* mapreduce_task_combine_progress_records: nat *)
  0                 (* mapreduce_task_io_sort_factor: nat *)
  0                 (* mapreduce_task_io_sort_mb: nat *)
  0                 (* mapreduce_task_merge_progress_records: nat *)
  (mk_range 0 2)            (* mapreduce_task_profile_maps: Range *)
  "task-profile"    (* mapreduce_task_profile_reduces: string *)
  0                 (* mapreduce_tasktracker_http_threads: nat *)
  0                 (* mapreduce_tasktracker_indexcache_mb: nat *)
  0                 (* mapreduce_tasktracker_map_tasks_maximum: nat *)
  0                 (* mapreduce_tasktracker_reduce_tasks_maximum: nat *)
  0                 (* mapreduce_tasktracker_taskmemorymanager_monitoringinterval: nat *)

  (* integrity constraints *)
  mapreduce_map_cpu_vcores_le_total_cpu
  my_mapreduce_map_memory_mb_le_total_mem
  my_mapreduce_map_java_opts_lt_my_mapreduce_map_memory_mb.

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

Definition my_yarn_app_mapreduce_am_command__opts := mk_java_opts 20 M.


(*define a configuation for CORE sub-component*)
Definition yarn_config1 := mk_yarn_config
  my_yarn_app_mapreduce_am_command__opts        (* yarn_app_mapreduce_am_command__opts: JavaOpts *)
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

