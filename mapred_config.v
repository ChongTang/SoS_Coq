Require Export String.
Require Export Coq.ZArith.BinInt.

Open Scope string_scope.
Open Scope Z_scope.
Require Import util.

(*Configuration for MapRed sub-component*)
(*
Record MapRedConfig (cdt: ENVCondition) := mk_mapred_config {
*)
Record MapRedConfig (total_cpu: Z) (total_phy_mem: Z) := mk_mapred_config {
   mapred_child_java_opts: JavaOpts
  ;mapred_map_output_compression_type: string
  ;mapreduce_ifile_readahead: bool
  ;mapreduce_ifile_readahead_bytes: if (mapreduce_ifile_readahead) 
                                                            then Z 
                                                            else True
  ;mapreduce_input_fileinputformat_split_maxsize: Z
  ;mapreduce_input_fileinputformat_split_minsize: Z
  ;mapreduce_input_lineinputformat_linespermap: Z
  ;mapreduce_job_counters_max: Z
  ;mapreduce_job_jvm_numtasks: Z
  ;mapreduce_job_maps: Z
  ;mapreduce_job_max_split_locations: Z
  ;mapreduce_job_reduce_slowstart_completedmaps: Float
  ;mapreduce_job_reducer_unconditional__preempt_delay_sec: Z
  ;mapreduce_job_reduces: Z
  ;mapreduce_job_running_map_limit: Z
  ;mapreduce_job_running_reduce_limit: Z
  ;mapreduce_job_speculative_minimum__allowed__tasks: Z
  ;mapreduce_job_speculative_retry__after__no__speculate: Z
  ;mapreduce_job_speculative_retry__after__speculate: Z
  ;mapreduce_job_speculative_speculative__cap__running__tasks: Float
  ;mapreduce_job_speculative_speculative__cap__total__tasks: Float
  ;mapreduce_job_split_metainfo_maxsize: Z
  ;mapreduce_job_ubertask_enable: bool
  ;mapreduce_job_ubertask_maxmaps: Z
  ;mapreduce_job_ubertask_maxreduces: Z
  ;mapreduce_jobtracker_expire_trackers_interval: Z
  ;mapreduce_jobtracker_handler_count: Z
  ;mapreduce_jobtracker_maxtasks_perjob: Z
  ;mapreduce_jobtracker_taskcache_levels: Z
  ;mapreduce_map_cpu_vcores: Z
  ;mapreduce_map_java_opts: JavaOpts
  ;mapreduce_map_maxattempts: Z
  ;mapreduce_map_memory_mb: Z
  ;mapreduce_map_output_compress: bool
  ;mapreduce_map_output_compress_codec: if (mapreduce_map_output_compress) then string else True
  ;mapreduce_map_skip_maxrecords: Z
  ;mapreduce_map_skip_proc_count_autoincr: bool
  ;mapreduce_map_sort_spill_percent: Float
  ;mapreduce_map_speculative: bool
  ;mapreduce_output_fileoutputformat_compress: bool
  ;mapreduce_output_fileoutputformat_compress_codec: if (mapreduce_output_fileoutputformat_compress) then string else True
  ;mapreduce_output_fileoutputformat_compress_type: if (mapreduce_output_fileoutputformat_compress) then string else True
  ;mapreduce_reduce_cpu_vcores: Z
  ;mapreduce_reduce_input_buffer_percent: Float
  ;mapreduce_reduce_java_opts: JavaOpts
  ;mapreduce_reduce_markreset_buffer_percent: Float
  ;mapreduce_reduce_maxattempts: Z
  ;mapreduce_reduce_memory_mb: Z
  ;mapreduce_reduce_merge_inmem_threshold: Z
  ;mapreduce_reduce_shuffle_input_buffer_percent: Float
  ;mapreduce_reduce_shuffle_memory_limit_percent: Float
  ;mapreduce_reduce_shuffle_merge_percent: Float
  ;mapreduce_reduce_shuffle_parallelcopies: Z
  ;mapreduce_reduce_shuffle_retry__delay_max_ms: Z
  ;mapreduce_shuffle_max_connections: Z
  ;mapreduce_shuffle_max_threads: Z
  ;mapreduce_shuffle_transfer_buffer_size: Z
  ;mapreduce_task_combine_progress_records: Z
  ;mapreduce_task_io_sort_factor: Z
  ;mapreduce_task_io_sort_mb: Z
  ;mapreduce_task_merge_progress_records: Z
  ;mapreduce_task_profile_maps: Range
  ;mapreduce_task_profile_reduces: Range
  ;mapreduce_tasktracker_http_threads: Z
  ;mapreduce_tasktracker_indexcache_mb: Z 
  ;mapreduce_tasktracker_map_tasks_maximum: Z
  ;mapreduce_tasktracker_reduce_tasks_maximum: Z
  ;mapreduce_tasktracker_taskmemorymanager_monitoringinterval: Z

  (*some restrictions from environment conditions
  *first restriction: map CPU cores should less than total CPU cores.
  *)
  ;map_cpu_core_le_total_cores: mapreduce_map_cpu_vcores < total_cpu
  ;map_mem_le_total_mem: mapreduce_map_memory_mb < total_phy_mem

  (*
  We can also define some constraints among parameters (internal constraints)*
  *The first constraint is that the java heap space should be less than the memory for map tasks
  *)
  ;map_java_opts_le_map_mem: heap_size mapreduce_map_java_opts <= mapreduce_map_memory_mb
}.