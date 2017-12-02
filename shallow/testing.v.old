Require Import String.
Open Scope string_scope.
Require Import Omega.
Require Import hadoop_config.

(*
Environment parameter values.
*)
Definition total_cpu := 8.
Definition total_mem := 4096.

(*
Configuration parameter values.
*)
Definition my_mapreduce_map_cpu_vcores := 4.
Definition my_mapreduce_map_memory_mb := 1024.
Definition my_mapred_child_java_opts := mk_java_opts 200 M. 
Definition my_mapreduce_map_java_opts := mk_java_opts 1024 M. 
Definition my_mapreduce_reduce_java_opts := mk_java_opts 2560 M.
Definition my_mapred_map_output_compression_type := "BLOCK".
Definition my_mapreduce_ifile_readahead := true.
Definition my_mapreduce_ifile_readahead_bytes := 4194%Z.
Definition my_mapreduce_input_fileinputformat_split_maxsize := 2684%Z.
Definition my_mapreduce_input_fileinputformat_split_minsize := 0%Z.
Definition my_mapreduce_input_lineinputformat_linespermap := 1%Z.
Definition my_mapreduce_job_counters_max := 120%Z.
Definition my_mapreduce_job_jvm_numtasks := 1%Z.
Definition my_mapreduce_job_maps := 2%Z.
Definition my_mapreduce_job_max_split_locations := 10%Z.
Definition my_mapreduce_job_reduce_slowstart_completedmaps := mk_float 0 5.
Definition my_mapreduce_job_reducer_unconditional__preempt_delay_sec := 300%Z.
Definition my_mapreduce_job_reduces := 1%Z.
Definition my_mapreduce_job_running_map_limit := 0%Z.
Definition my_mapreduce_job_running_reduce_limit := 0%Z.
Definition my_mapreduce_job_speculative_minimum__allowed__tasks := 10%Z.
Definition my_mapreduce_job_speculative_retry__after__no__speculate := 100%Z.
Definition my_mapreduce_job_speculative_retry__after__speculate := 1500%Z.
Definition my_mapreduce_job_speculative_speculative__cap__running__tasks := mk_float 0 1.
Definition my_mapreduce_job_speculative_speculative__cap__total__tasks := mk_float 0 01.
Definition my_mapreduce_job_split_metainfo_maxsize := 1000%Z.
Definition my_mapreduce_job_ubertask_enable := false.
Definition my_mapreduce_job_ubertask_maxmaps := 9%Z.
Definition my_mapreduce_job_ubertask_maxreduces := 1%Z.
Definition my_mapreduce_jobtracker_expire_trackers_interval := 6000%Z.
Definition my_mapreduce_jobtracker_handler_count := 10%Z.
Definition my_mapreduce_jobtracker_maxtasks_perjob := 100%Z.
Definition my_mapreduce_jobtracker_taskcache_levels := 2%Z.
Definition my_mapreduce_map_maxattempts := 4%Z.
Definition my_mapreduce_map_output_compress := false.
Definition my_mapreduce_map_output_compress_codec := I.
Definition my_mapreduce_map_skip_maxrecords := 0%Z.
Definition my_mapreduce_map_skip_proc_count_autoincr := true.
Definition my_mapreduce_map_sort_spill_percent := mk_float 0 5.
Definition my_mapreduce_map_speculative := true.
Definition my_mapreduce_output_fileoutputformat_compress := true.
Definition my_mapreduce_output_fileoutputformat_compress_codec := "org.apache.hadoop.io.compress.DefaultCodec".
Definition my_mapreduce_output_fileoutputformat_compress_type := "RECORD".
Definition my_mapreduce_reduce_cpu_vcores := 1%Z.
Definition my_mapreduce_reduce_input_buffer_percent := mk_float 0 7.
Definition my_mapreduce_reduce_markreset_buffer_percent := mk_float 0 0.
Definition my_mapreduce_reduce_maxattempts := 4%Z.
Definition my_mapreduce_reduce_memory_mb := 1024%Z.
Definition my_mapreduce_reduce_merge_inmem_threshold := 1000%Z.
Definition my_mapreduce_reduce_shuffle_input_buffer_percent := mk_float 0 7.
Definition my_mapreduce_reduce_shuffle_memory_limit_percent := mk_float 0 25.
Definition my_mapreduce_reduce_shuffle_merge_percent := mk_float 0 66.
Definition my_mapreduce_reduce_shuffle_parallelcopies := 5%Z.
Definition my_mapreduce_reduce_shuffle_retry__delay_max_ms := 6000%Z.
Definition my_mapreduce_shuffle_max_connections := 0%Z.
Definition my_mapreduce_shuffle_max_threads := 0%Z.
Definition my_mapreduce_shuffle_transfer_buffer_size := 1310%Z.
Definition my_mapreduce_task_combine_progress_records := 1000%Z.
Definition my_mapreduce_task_io_sort_factor := 10%Z.
Definition my_mapreduce_task_io_sort_mb := 100%Z.
Definition my_mapreduce_task_merge_progress_records := 1000%Z.
Definition my_mapreduce_task_profile_maps := mk_range 0 2.
Definition my_mapreduce_task_profile_reduces := mk_range 0 2.
Definition my_mapreduce_tasktracker_http_threads := 40%Z.
Definition my_apreduce_tasktracker_indexcache_mb := 10%Z.
Definition my_mapreduce_tasktracker_map_tasks_maximum := 2%Z.
Definition my_mapreduce_tasktracker_reduce_tasks_maximum := 2%Z.
Definition my_mapreduce_tasktracker_taskmemorymanager_monitoringinterval := 500%Z.

(*
Configuration proofs of constraint integrity.
*)
Theorem my_mapreduce_map_cpu_vcores_le_total_cpu: 
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
                  heap_size my_mapreduce_map_java_opts <= my_mapreduce_map_memory_mb.
simpl. unfold my_mapreduce_map_memory_mb. omega. Qed.

(*define a configuation for MapReduce sub-component*)
Definition my_mapred_config := mk_mapred_config total_cpu total_mem 
  my_mapred_child_java_opts        (* mapred_child_java_opts: JavaOpts *)
  my_mapred_map_output_compression_type       (* mapred_map_output_compression_type: string *)
  my_mapreduce_ifile_readahead                (* mapreduce_ifile_readahead: bool *)
  my_mapreduce_ifile_readahead_bytes          (* mapreduce_ifile_readahead_bytes: if (mapreduce_ifile_readahead) then nat else True *)
  my_mapreduce_input_fileinputformat_split_maxsize      (* mapreduce_input_fileinputformat_split_maxsize: nat *)
  my_mapreduce_input_fileinputformat_split_minsize      (* mapreduce_input_fileinputformat_split_minsize: nat *)
  my_mapreduce_input_lineinputformat_linespermap        (* mapreduce_input_lineinputformat_linespermap: nat *)
  my_mapreduce_job_counters_max            (* mapreduce_job_counters_max: nat *)
  my_mapreduce_job_jvm_numtasks            (* mapreduce_job_jvm_numtasks: nat *)
  my_mapreduce_job_maps                    (* mapreduce_job_maps: nat *)
  my_mapreduce_job_max_split_locations     (* mapreduce_job_max_split_locations: nat *)
  my_mapreduce_job_reduce_slowstart_completedmaps             (* mapreduce_job_reduce_slowstart_completedmaps: Float *)
  my_mapreduce_job_reducer_unconditional__preempt_delay_sec   (* mapreduce_job_reducer_unconditional__preempt_delay_sec: nat *)
  my_mapreduce_job_reduces                 (* mapreduce_job_reduces: nat *)
  my_mapreduce_job_running_map_limit       (* mapreduce_job_running_map_limit: nat *)
  my_mapreduce_job_running_reduce_limit                 (* mapreduce_job_running_reduce_limit: nat *)
  my_mapreduce_job_speculative_minimum__allowed__tasks  (* mapreduce_job_speculative_minimum__allowed__tasks: nat *)
  my_mapreduce_job_speculative_retry__after__no__speculate    (* mapreduce_job_speculative_retry__after__no__speculate: nat *)
  my_mapreduce_job_speculative_retry__after__speculate        (* mapreduce_job_speculative_retry__after__speculate: nat *)
  my_mapreduce_job_speculative_speculative__cap__running__tasks    (* mapreduce_job_speculative_speculative__cap__running__tasks: Float *)
  my_mapreduce_job_speculative_speculative__cap__total__tasks      (* mapreduce_job_speculative_speculative__cap__total__tasks: Float *)
  my_mapreduce_job_split_metainfo_maxsize                 (* mapreduce_job_split_metainfo_maxsize: nat *)
  my_mapreduce_job_ubertask_enable            (* mapreduce_job_ubertask_enable: string WRONG-KS *)
  my_mapreduce_job_ubertask_maxmaps           (* mapreduce_job_ubertask_maxmaps: nat *)
  my_mapreduce_job_ubertask_maxreduces        (* mapreduce_job_ubertask_maxreduces: nat *)
  my_mapreduce_jobtracker_expire_trackers_interval  (* mapreduce_jobtracker_expire_trackers_interval: nat *)
  my_mapreduce_jobtracker_handler_count                 (* mapreduce_jobtracker_handler_count: nat *)
  my_mapreduce_jobtracker_maxtasks_perjob                 (* mapreduce_jobtracker_maxtasks_perjob: nat *)
  my_mapreduce_jobtracker_taskcache_levels                (* mapreduce_jobtracker_taskcache_levels: nat *)
  my_mapreduce_map_cpu_vcores         (* mapreduce_map_cpu_vcores: nat *)
  my_mapreduce_map_java_opts        (* mapreduce_map_java_opts: JavaOpts *)
  my_mapreduce_map_maxattempts                 (* mapreduce_map_maxattempts: nat *)
  my_mapreduce_map_memory_mb       (* mapreduce_map_memory_mb: nat *)
  my_mapreduce_map_output_compress             (* mapreduce_map_output_compress: bool *)
  my_mapreduce_map_output_compress_codec      (* mapreduce_map_output_compress_codec: if (mapreduce_map_output_compress) then string else True *)
  my_mapreduce_map_skip_maxrecords                 (* mapreduce_map_skip_maxrecords: nat *)
  my_mapreduce_map_skip_proc_count_autoincr        (* mapreduce_map_skip_proc_count_autoincr: bool *)
  my_mapreduce_map_sort_spill_percent           (* mapreduce_map_sort_spill_percent: Float *)
  my_mapreduce_map_speculative             (* mapreduce_map_speculative: bool *)
  my_mapreduce_output_fileoutputformat_compress              (* mapreduce_output_fileoutputformat_compress: bool *)
  my_mapreduce_output_fileoutputformat_compress_codec   (* mapreduce_output_fileoutputformat_compress_codec: if (mapreduce_output_fileoutputformat_compress) then string else True *)
  my_mapreduce_output_fileoutputformat_compress_type    (* mapreduce_output_fileoutputformat_compress_type: if (mapreduce_output_fileoutputformat_compress) then string else True *)
  my_mapreduce_reduce_cpu_vcores                 (* mapreduce_reduce_cpu_vcores: nat *)
  my_mapreduce_reduce_input_buffer_percent            (* mapreduce_reduce_input_buffer_percent: Float *)
  my_mapreduce_reduce_java_opts        (* mapreduce_reduce_java_opts: JavaOpts *)
  my_mapreduce_reduce_markreset_buffer_percent            (* mapreduce_reduce_markreset_buffer_percent: Float *)
  my_mapreduce_reduce_maxattempts                 (* mapreduce_reduce_maxattempts: nat *)
  my_mapreduce_reduce_memory_mb                 (* mapreduce_reduce_memory_mb: nat *)
  my_mapreduce_reduce_merge_inmem_threshold                 (* mapreduce_reduce_merge_inmem_threshold: nat *)
  my_mapreduce_reduce_shuffle_input_buffer_percent            (* mapreduce_reduce_shuffle_input_buffer_percent: Float *)
  my_mapreduce_reduce_shuffle_memory_limit_percent          (* mapreduce_reduce_shuffle_memory_limit_percent: Float *)
  my_mapreduce_reduce_shuffle_merge_percent            (* mapreduce_reduce_shuffle_merge_percent: Float *)
  my_mapreduce_reduce_shuffle_parallelcopies                 (* mapreduce_reduce_shuffle_parallelcopies: nat *)
  my_mapreduce_reduce_shuffle_retry__delay_max_ms                 (* mapreduce_reduce_shuffle_retry__delay_max_ms: nat *)
  my_mapreduce_shuffle_max_connections                 (* mapreduce_shuffle_max_connections: nat *)
  my_mapreduce_shuffle_max_threads                 (* mapreduce_shuffle_max_threads: nat *)
  my_mapreduce_shuffle_transfer_buffer_size                 (* mapreduce_shuffle_transfer_buffer_size: nat *)
  my_mapreduce_task_combine_progress_records                 (* mapreduce_task_combine_progress_records: nat *)
  my_mapreduce_task_io_sort_factor                 (* mapreduce_task_io_sort_factor: nat *)
  my_mapreduce_task_io_sort_mb                 (* mapreduce_task_io_sort_mb: nat *)
  my_mapreduce_task_merge_progress_records                 (* mapreduce_task_merge_progress_records: nat *)
  my_mapreduce_task_profile_maps            (* mapreduce_task_profile_maps: Range *)
  my_mapreduce_task_profile_reduces    (* mapreduce_task_profile_reduces: Range *)
  my_mapreduce_tasktracker_http_threads                 (* mapreduce_tasktracker_http_threads: nat *)
  my_apreduce_tasktracker_indexcache_mb                 (* mapreduce_tasktracker_indexcache_mb: nat *)
  my_mapreduce_tasktracker_map_tasks_maximum                 (* mapreduce_tasktracker_map_tasks_maximum: nat *)
  my_mapreduce_tasktracker_reduce_tasks_maximum                 (* mapreduce_tasktracker_reduce_tasks_maximum: nat *)
  my_mapreduce_tasktracker_taskmemorymanager_monitoringinterval                 (* mapreduce_tasktracker_taskmemorymanager_monitoringinterval: nat *)

  (* integrity constraints *)
  my_mapreduce_map_cpu_vcores_le_total_cpu
  my_mapreduce_map_memory_mb_le_total_mem
  my_mapreduce_map_java_opts_lt_my_mapreduce_map_memory_mb.

(* define a configuation for HDFS sub-component *)
Definition my_fs_namenode_handler_count := 10%Z.
Definition my_dfs_replication := 3%Z.

(*define a configuation for HDFS sub-component*)
Definition my_hdfs_config := mk_hdfs_config 
  my_fs_namenode_handler_count                 (* dfs_namenode_handler_count: nat *)
  my_dfs_replication.                          (* dfs_replication: nat *)

(*define a configuation for CORE sub-component*)
Definition my_io_compression_codecs := "org.apache.hadoop.io.compress.DefaultCodec".
Definition my_io_file_buffer_size := 4096%Z.
Definition my_io_map_index_interval := 128%Z.
Definition my_io_map_index_skip := 0%Z.
Definition my_io_seqfile_compress_blocksize := 1000%Z.
Definition my_io_seqfile_sorter_recordlimit := 1000%Z.
Definition my_ipc_maximum_data_length := 6710%Z.

Definition my_core_config := mk_hadoop_core_config
  my_io_compression_codecs   			  (* io_compression_codecs: string *)
  my_io_file_buffer_size            (* io_file_buffer_size: nat *) 
  my_io_map_index_interval          (* io_map_index_interval: nat *)
  my_io_map_index_skip               (* io_map_index_skip: nat *)
  my_io_seqfile_compress_blocksize  (* io_seqfile_compress_blocksize: nat *)
  my_io_seqfile_sorter_recordlimit  (* io_seqfile_sorter_recordlimit: nat*)
  my_ipc_maximum_data_length.       (* ipc_maximum_data_length: nat *)


(*define a configuation for CORE sub-component*)
Definition my_yarn_app_mapreduce_am_command__opts := mk_java_opts 1024 M.
Definition my_yarn_app_mapreduce_am_containerlauncher_threadpool__initial__size := 10%Z.
Definition my_yarn_app_mapreduce_am_job_task_listener_thread__count := 30%Z.
Definition my_yarn_app_mapreduce_am_resource_cpu__vcores := 1%Z.
Definition my_yarn_app_mapreduce_am_resource_mb := 1536%Z.
Definition my_yarn_nodemanager_container__manager_thread__count := 20%Z.
Definition my_yarn_nodemanager_localizer_client_thread__count := 5%Z.
Definition my_yarn_nodemanager_localizer_fetch_thread__count := 4%Z.
Definition my_yarn_nodemanager_resource_cpu__vcores := 0%Z.
Definition my_yarn_nodemanager_resource_memory__mb := 0%Z.
Definition my_yarn_nodemanager_resource_percentage__physical__cpu__limit := 100%Z. (*100 means 100%*)
Definition my_yarn_nodemanager_vmem__check__enabled := true.
Definition my_yarn_nodemanager_windows__container_cpu__limit_enabled := false.
Definition my_yarn_nodemanager_windows__container_memory__limit_enabled := false.
Definition my_yarn_resourcemanager_admin_client_thread__count := 1%Z.
Definition my_yarn_resourcemanager_amlauncher_thread__count := 50%Z.
Definition my_yarn_resourcemanager_client_thread__count := 50%Z.
Definition my_yarn_resourcemanager_resource__tracker_client_thread__count := 50%Z.
Definition my_yarn_resourcemanager_scheduler_class := "org.apache.hadoop.yarn.server.resourcemanager.scheduler.capacity.CapacityScheduler".
Definition my_yarn_resourcemanager_scheduler_client_thread__count := 50%Z.
Definition my_yarn_resourcemanager_store_class := "org.apache.hadoop.yarn.server.resourcemanager.recovery.FileSystemRMStateStore".
Definition my_yarn_scheduler_increment__allocation__mb := 512%Z.
Definition my_yarn_scheduler_maximum__allocation__mb := 819%Z.
Definition my_yarn_scheduler_maximum__allocation__vcores := 1%Z.
Definition my_yarn_scheduler_minimum__allocation__mb := 1024%Z.
Definition my_yarn_scheduler_minimum__allocation__vcores := 1%Z.
Definition my_yarn_sharedcache_enabled := false.
Definition my_yarn_sharedcache_admin_thread__count := I.
Definition my_yarn_sharedcache_client__server_thread__count := I.

Definition my_yarn_config := mk_yarn_config
  my_yarn_app_mapreduce_am_command__opts        (* yarn_app_mapreduce_am_command__opts: JavaOpts *)
  my_yarn_app_mapreduce_am_containerlauncher_threadpool__initial__size                 (* yarn_app_mapreduce_am_containerlauncher_threadpool__initial__size: nat *)
  my_yarn_app_mapreduce_am_job_task_listener_thread__count                 (* yarn_app_mapreduce_am_job_task_listener_thread__count: nat *)
  my_yarn_app_mapreduce_am_resource_cpu__vcores                 (* yarn_app_mapreduce_am_resource_cpu__vcores: nat *)
  my_yarn_app_mapreduce_am_resource_mb                 (* yarn_app_mapreduce_am_resource_mb: nat *)
  my_yarn_nodemanager_container__manager_thread__count                 (* yarn_nodemanager_container__manager_thread__count: nat *)
  my_yarn_nodemanager_localizer_client_thread__count                 (* yarn_nodemanager_localizer_client_thread__count: nat *)
  my_yarn_nodemanager_localizer_fetch_thread__count                 (* yarn_nodemanager_localizer_fetch_thread__count: nat *)
  my_yarn_nodemanager_resource_cpu__vcores                 (* yarn_nodemanager_resource_cpu__vcores: nat *)
  my_yarn_nodemanager_resource_memory__mb                 (* yarn_nodemanager_resource_memory__mb: nat *)
  my_yarn_nodemanager_resource_percentage__physical__cpu__limit                 (* yarn_nodemanager_resource_percentage__physical__cpu__limit: nat (*100 means 100%*) *)
  my_yarn_nodemanager_vmem__check__enabled              (* yarn_nodemanager_vmem__check__enabled: bool *)
  my_yarn_nodemanager_windows__container_cpu__limit_enabled              (* yarn_nodemanager_windows__container_cpu__limit_enabled: bool *)
  my_yarn_nodemanager_windows__container_memory__limit_enabled              (* yarn_nodemanager_windows__container_memory__limit_enabled: bool *)
  my_yarn_resourcemanager_admin_client_thread__count                 (* yarn_resourcemanager_admin_client_thread__count: nat  *)
  my_yarn_resourcemanager_amlauncher_thread__count                 (* yarn_resourcemanager_amlauncher_thread__count: nat *)
  my_yarn_resourcemanager_client_thread__count                 (* yarn_resourcemanager_client_thread__count: nat *)
  my_yarn_resourcemanager_resource__tracker_client_thread__count                 (* yarn_resourcemanager_resource__tracker_client_thread__count: nat *)
  my_yarn_resourcemanager_scheduler_class       (* yarn_resourcemanager_scheduler_class: string *)
  my_yarn_resourcemanager_scheduler_client_thread__count                 (* yarn_resourcemanager_scheduler_client_thread__count: nat *)
  my_yarn_resourcemanager_store_class     (* yarn_resourcemanager_store_class: string *)
  my_yarn_scheduler_increment__allocation__mb                 (* yarn_scheduler_increment__allocation__mb: nat *)
  my_yarn_scheduler_maximum__allocation__mb                 (* yarn_scheduler_maximum__allocation__mb: nat *)
  my_yarn_scheduler_maximum__allocation__vcores                 (* yarn_scheduler_maximum__allocation__vcores: nat *)
  my_yarn_scheduler_minimum__allocation__mb                 (* yarn_scheduler_minimum__allocation__mb: nat *)
  my_yarn_scheduler_minimum__allocation__vcores                 (* yarn_scheduler_minimum__allocation__vcores: nat *)
  my_yarn_sharedcache_enabled                             (* yarn_sharedcache_enabled: bool *)
  my_yarn_sharedcache_admin_thread__count                 (* yarn_sharedcache_admin_thread__count: if (yarn_sharedcache_enabled) then nat else True *)
  my_yarn_sharedcache_client__server_thread__count.       (* yarn_sharedcache_client__server_thread__count: if (yarn_sharedcache_enabled) *)

(*
Now we are able to define a full hadoop configuration given multiple 
configurations for sub-components.

Here the resource manager is Yarn, so we provide my_yarn_config here.
*)

(*I have difficult to provide a proof for constraints in MapRedConfig*)
Definition my_hadoop_config := mk_hadoop_config 
  total_cpu         (* total_cpu: nat *) 
  total_mem         (* total_phy_mem: nat *)
  Yarn		    (* resource_mgr: ResourceManager*)
  my_yarn_config             (* rm_config_type resource_mgr *)
  my_mapred_config    (* mapred_config: (MapRedConfig total_cpu total_phy_mem) *)
  my_core_config      (* core_config: HadoopCoreConfig *)
  my_hdfs_config.     (* hdfs_config: HDFSConfig *)

