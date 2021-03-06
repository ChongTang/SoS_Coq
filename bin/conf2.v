Require Import hadoop_config.
Require Import Reals.
Open Scope R_scope.
Require Import Omega.

Definition a_core_config: CoreConfig.
Proof.
unshelve refine (
    mk_core_config
    (io_file_buffer_size.mk false 65536%positive _ )
    (io_map_index_interval.mk false 115%positive _ )
    (io_map_index_skip.mk false 4%N _ )
    (io_seqfile_compress_blocksize.mk false 800000%positive _ )
    (io_seqfile_sorter_recordlimit.mk false 1100000%positive _ )
    (ipc_maximum_data_length.mk false 53000000%positive _ )
); try (exact I); try compute; auto.
Defined.


Definition a_hdfs_config: HDFSConfig.
Proof.
unshelve refine (
    mk_hdfs_config
    (dfs_namenode_handler_count.mk false 10%positive _ )
    (dfs_replication.mk false 1%positive _ )
); try (exact I).
Defined.


Definition a_mapred_config: MapRedConfig.
Proof.
unshelve refine (
    mk_mapred_config
    (mapred_child_java_opts.mk false (mk_java_opts 200%positive 100%positive) _ )
    (mapreduce_ifile_readahead.mk false true _ )
    (mapreduce_ifile_readahead_bytes.mk false 3145728%positive _ )
    (mapreduce_input_fileinputformat_split_maxsize.mk false 536870912%positive _ )
    (mapreduce_input_fileinputformat_split_minsize.mk false 134217728%N _ )
    (mapreduce_input_lineinputformat_linespermap.mk false 1%positive _ )
    (mapreduce_job_counters_max.mk false 80%positive _ )
    (mapreduce_job_jvm_numtasks.mk false (Some 4%positive) _ )
    (mapreduce_job_max_split_locations.mk false 16%positive _ )
    (mapreduce_job_reduce_slowstart_completedmaps.mk false (5/100)%R _ )
    (mapreduce_job_reducer_unconditional__preempt_delay_sec.mk false 240%positive _ )
    (mapreduce_job_running_map_limit.mk false (Some 10%positive) _ )
    (mapreduce_job_running_reduce_limit.mk false (Some 4%positive) _ )
    (mapreduce_job_speculative_minimum__allowed__tasks.mk false 16%positive _ )
    (mapreduce_job_speculative_retry__after__no__speculate.mk false 700%positive _ )
    (mapreduce_job_speculative_retry__after__speculate.mk false 12000%positive _ )
    (mapreduce_job_speculative_speculative__cap__running__tasks.mk false (14/100)%R _ )
    (mapreduce_job_speculative_speculative__cap__total__tasks.mk false (6/100)%R _ )
    (mapreduce_job_split_metainfo_maxsize.mk false (Some 9000000%positive) _ )
    (mapreduce_job_ubertask_enable.mk false true _ )
    (mapreduce_job_ubertask_maxmaps.mk false 11%positive _ )
    (mapreduce_job_ubertask_maxreduces.mk false (Some 2%positive) _ )
    (mapreduce_jobtracker_expire_trackers_interval.mk false 540000%positive _ )
    (mapreduce_jobtracker_handler_count.mk false 14%positive _ )
    (mapreduce_jobtracker_maxtasks_perjob.mk false (Some 30%positive) _ )
    (mapreduce_jobtracker_taskcache_levels.mk false 5%positive _ )
    (mapreduce_map_cpu_vcores.mk false 3%positive _ )
    (mapreduce_map_java_opts.mk false (mk_java_opts 922%positive 100%positive) _ )
    (mapreduce_map_memory_mb.mk false 780%positive _ )
    (mapreduce_map_output_compress.mk false false _ )
    (mapreduce_map_output_compress_codec.mk false "org.apache.hadoop.io.compress.BZip2Codec" _ )
    (mapreduce_map_skip_maxrecords.mk false 4%N _ )
    (mapreduce_map_skip_proc_count_autoincr.mk false false _ )
    (mapreduce_map_sort_spill_percent.mk false (64/100)%R _ )
    (mapreduce_map_speculative.mk false false _ )
    (mapreduce_output_fileoutputformat_compress.mk false false _ )
    (mapreduce_output_fileoutputformat_compress_codec.mk false "org.apache.hadoop.io.compress.GzipCodec" _ )
    (mapreduce_output_fileoutputformat_compress_type.mk false "NONE" _ )
    (mapreduce_reduce_cpu_vcores.mk false 2%positive _ )
    (mapreduce_reduce_input_buffer_percent.mk false (30/100)%R _ )
    (mapreduce_reduce_java_opts.mk false (mk_java_opts 2560%positive 100%positive) _ )
    (mapreduce_reduce_markreset_buffer_percent.mk false (15/100)%R _ )
    (mapreduce_reduce_memory_mb.mk false 890%positive _ )
    (mapreduce_reduce_merge_inmem_threshold.mk false (Some 1000%positive) _ )
    (mapreduce_reduce_shuffle_input_buffer_percent.mk false (70/100)%R _ )
    (mapreduce_reduce_shuffle_memory_limit_percent.mk false (35/100)%R _ )
    (mapreduce_reduce_shuffle_merge_percent.mk false (55/100)%R _ )
    (mapreduce_reduce_shuffle_parallelcopies.mk false 3%positive _ )
    (mapreduce_shuffle_max_connections.mk false (Some 4%positive) _ )
    (mapreduce_shuffle_max_threads.mk false 8%N _ )
    (mapreduce_shuffle_transfer_buffer_size.mk false 131072%positive _ )
    (mapreduce_task_combine_progress_records.mk false 10000%positive _ )
    (mapreduce_task_io_sort_factor.mk false 12%positive _ )
    (mapreduce_task_io_sort_mb.mk false 80%positive _ )
    (mapreduce_task_merge_progress_records.mk false 10000%positive _ )
    (mapreduce_task_profile_maps.mk false "0-2" _ )
    (mapreduce_task_profile_reduces.mk false "0-2" _ )
    (mapreduce_tasktracker_http_threads.mk false 40%positive _ )
    (mapreduce_tasktracker_indexcache_mb.mk false 14%positive _ )
    (mapreduce_tasktracker_map_tasks_maximum.mk false 1%positive _ )
    (mapreduce_tasktracker_reduce_tasks_maximum.mk false 5%positive _ )
    (mapreduce_tasktracker_taskmemorymanager_monitoringinterval.mk false 5500%positive _ )
    (yarn_app_mapreduce_am_command__opts.mk false (mk_java_opts 1024%positive 100%positive) _ )
    (yarn_app_mapreduce_am_containerlauncher_threadpool__initial__size.mk false 6%positive _ )
    (yarn_app_mapreduce_am_job_task_listener_thread__count.mk false 50%positive _ )
    (yarn_app_mapreduce_am_resource_cpu__vcores.mk false 6%positive _ )
    (yarn_app_mapreduce_am_resource_mb.mk false 2880%positive _ )
      _
    _
    _
    _
    _
); try (exact I); simpl; try (intro H); try (inversion H); try compute; try reflexivity; auto.
Defined.


Definition a_yarn_config: YarnConfig.
Proof.
unshelve refine (
    mk_yarn_config
    (yarn_nodemanager_container__manager_thread__count.mk false 24%positive _ )
    (yarn_nodemanager_localizer_client_thread__count.mk false 5%positive _ )
    (yarn_nodemanager_localizer_fetch_thread__count.mk false 2%positive _ )
    (yarn_nodemanager_recovery_compaction__interval__secs.mk false 3200%positive _ )
    (yarn_nodemanager_resource_cpu__vcores.mk false 20%positive _ )
    (yarn_nodemanager_resource_memory__mb.mk false 18432%positive _ )
    (yarn_nodemanager_resource_percentage__physical__cpu__limit.mk false 80%positive _ )
    (yarn_nodemanager_vmem__check__enabled.mk false false _ )
    (yarn_resourcemanager_admin_client_thread__count.mk false 4%positive _ )
    (yarn_resourcemanager_amlauncher_thread__count.mk false 60%positive _ )
    (yarn_resourcemanager_client_thread__count.mk false 30%positive _ )
    (yarn_resourcemanager_resource__tracker_client_thread__count.mk false 30%positive _ )
    (yarn_resourcemanager_scheduler_class.mk false "org.apache.hadoop.yarn.server.resourcemanager.scheduler.capacity.CapacityScheduler" _ )
    (yarn_resourcemanager_scheduler_client_thread__count.mk false 50%positive _ )
    (yarn_resourcemanager_store_class.mk false "org.apache.hadoop.yarn.server.resourcemanager.recovery.FileSystemRMStateStore" _ )
    (yarn_scheduler_increment__allocation__mb.mk false 1%positive _ )
    (yarn_scheduler_maximum__allocation__mb.mk false 6400%positive _ )
    (yarn_scheduler_maximum__allocation__vcores.mk false 35%positive _ )
    (yarn_scheduler_minimum__allocation__mb.mk false 2048%positive _ )
    (yarn_scheduler_minimum__allocation__vcores.mk false 4%positive _ )
    (yarn_sharedcache_admin_thread__count.mk false 2%positive _ )
    (yarn_sharedcache_client__server_thread__count.mk false 30%positive _ )
    (yarn_sharedcache_enabled.mk false false _ )
      _
      _
      _
); try (exact I); compute; try reflexivity; auto.
Defined.

    Definition a_hadoop_config: HadoopConfig.
    Proof.
     unshelve refine (
      mk_hadoop_config
        a_yarn_config
        a_mapred_config
        a_core_config
        a_hdfs_config
        _
        _
    ); try (exact I); simpl; omega.
    Defined.
    