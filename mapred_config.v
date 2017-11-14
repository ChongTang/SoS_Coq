Require Import String.
Open Scope string_scope.
Require Import util.

(*Configuration for MapRed sub-component*)
(*
Record MapRedConfig (cdt: ENVCondition) := mk_mapred_config {
*)
Record MapRedConfig (total_cpu: nat) (total_phy_mem:nat) := mk_mapred_config {
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
  *first restriction: map CPU cores should less than total CPU cores.
  ;map_cpu_core_le_total_cores: mapreduce_map_cpu_vcores < total_cpu
  ;map_mem_le_total_mem: mapreduce_map_memory_mb < total_phy_mem*)

  (*We can also define some constraints among parameters (internal constraints)*
  *The first constraint is that the java heap space should be less than the memory for map tasks*
  ;map_java_opts_le_map_mem: number mapreduce_map_java_opts < mapreduce_map_memory_mb *)
}.