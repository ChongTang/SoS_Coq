Require Export fieldType.
Require Import env_desc.
Require Import Coq.ZArith.Zdiv.
Open Scope string_scope.
Open Scope positive_scope.
Require Import Reals.
Open Scope R_scope.
Open Scope bool_scope.
Open Scope Z_scope.
Require Export List.
Open Scope list_scope.

Module mapred_child_java_opts_desc <: FieldModuleType.
  Definition fName := "mapred.child.java.opts".
  Definition mTipe := mTipe_JavaOpts.
  Definition rType := fun value: string => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapred_child_java_opts_desc.
Module mapred_child_java_opts := FieldModuleFunctor mapred_child_java_opts_desc.
Export mapred_child_java_opts.


Module mapred_map_output_compression_type_desc <: FieldModuleType.
  Definition fName := "mapred.map.output.compression.type".
  Definition mTipe := mTipe_string.
  Definition rType := fun value: string => In value ("NONE"::"RECORD"::"BLOCK"::nil).
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapred_map_output_compression_type_desc.
Module mapred_map_output_compression_type := FieldModuleFunctor mapred_map_output_compression_type_desc.
Export mapred_map_output_compression_type.


Module mapreduce_ifile_readahead_desc <: FieldModuleType.
  Definition fName := "mapreduce.ifile.readahead".
  Definition mTipe := mTipe_bool.
  Definition rType := fun value: bool => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_ifile_readahead_desc.
Module mapreduce_ifile_readahead := FieldModuleFunctor mapreduce_ifile_readahead_desc.
Export mapreduce_ifile_readahead.


Module mapreduce_ifile_readahead_bytes_desc <: FieldModuleType.
  Definition fName := "mapreduce.ifile.readahead.bytes".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_ifile_readahead_bytes_desc.
Module mapreduce_ifile_readahead_bytes := FieldModuleFunctor mapreduce_ifile_readahead_bytes_desc.
Export mapreduce_ifile_readahead_bytes.


Module mapreduce_input_fileinputformat_split_maxsize_desc <: FieldModuleType.
  Definition fName := "mapreduce.input.fileinputformat.split.maxsize".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_input_fileinputformat_split_maxsize_desc.
Module mapreduce_input_fileinputformat_split_maxsize := FieldModuleFunctor mapreduce_input_fileinputformat_split_maxsize_desc.
Export mapreduce_input_fileinputformat_split_maxsize.


Module mapreduce_input_fileinputformat_split_minsize_desc <: FieldModuleType.
  Definition fName := "mapreduce.input.fileinputformat.split.minsize".
  Definition mTipe := mTipe_N.
  Definition rType := fun value: N => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_input_fileinputformat_split_minsize_desc.
Module mapreduce_input_fileinputformat_split_minsize := FieldModuleFunctor mapreduce_input_fileinputformat_split_minsize_desc.
Export mapreduce_input_fileinputformat_split_minsize.


Module mapreduce_input_lineinputformat_linespermap_desc <: FieldModuleType.
  Definition fName := "mapreduce.input.lineinputformat.linespermap".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_input_lineinputformat_linespermap_desc.
Module mapreduce_input_lineinputformat_linespermap := FieldModuleFunctor mapreduce_input_lineinputformat_linespermap_desc.
Export mapreduce_input_lineinputformat_linespermap.


Module mapreduce_job_counters_max_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.counters.max".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_counters_max_desc.
Module mapreduce_job_counters_max := FieldModuleFunctor mapreduce_job_counters_max_desc.
Export mapreduce_job_counters_max.


Module mapreduce_job_jvm_numtasks_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.jvm.numtasks".
  Definition mTipe := mTipe_Z.
  Definition rType := fun value: Z => (Z.eq value (-1%Z)) \/ (value > 0%Z).
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_jvm_numtasks_desc.
Module mapreduce_job_jvm_numtasks := FieldModuleFunctor mapreduce_job_jvm_numtasks_desc.
Export mapreduce_job_jvm_numtasks.


Module mapreduce_job_max_split_locations_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.max.split.locations".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_max_split_locations_desc.
Module mapreduce_job_max_split_locations := FieldModuleFunctor mapreduce_job_max_split_locations_desc.
Export mapreduce_job_max_split_locations.


Module mapreduce_job_reduce_slowstart_completedmaps_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.reduce.slowstart.completedmaps".
  Definition mTipe := mTipe_float.
  Definition rType := fun value: R => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_reduce_slowstart_completedmaps_desc.
Module mapreduce_job_reduce_slowstart_completedmaps := FieldModuleFunctor mapreduce_job_reduce_slowstart_completedmaps_desc.
Export mapreduce_job_reduce_slowstart_completedmaps.


Module mapreduce_job_running_map_limit_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.running.map.limit".
  Definition mTipe := mTipe_Z.
  Definition rType := fun value: Z => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_running_map_limit_desc.
Module mapreduce_job_running_map_limit := FieldModuleFunctor mapreduce_job_running_map_limit_desc.
Export mapreduce_job_running_map_limit.


Module mapreduce_job_running_reduce_limit_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.running.reduce.limit".
  Definition mTipe := mTipe_Z.
  Definition rType := fun value: Z => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_running_reduce_limit_desc.
Module mapreduce_job_running_reduce_limit := FieldModuleFunctor mapreduce_job_running_reduce_limit_desc.
Export mapreduce_job_running_reduce_limit.


Module mapreduce_job_speculative_minimum__allowed__tasks_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.speculative.minimum-allowed-tasks".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_speculative_minimum__allowed__tasks_desc.
Module mapreduce_job_speculative_minimum__allowed__tasks := FieldModuleFunctor mapreduce_job_speculative_minimum__allowed__tasks_desc.
Export mapreduce_job_speculative_minimum__allowed__tasks.


Module mapreduce_job_speculative_retry__after__no__speculate_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.speculative.retry-after-no-speculate".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_speculative_retry__after__no__speculate_desc.
Module mapreduce_job_speculative_retry__after__no__speculate := FieldModuleFunctor mapreduce_job_speculative_retry__after__no__speculate_desc.
Export mapreduce_job_speculative_retry__after__no__speculate.


Module mapreduce_job_speculative_retry__after__speculate_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.speculative.retry-after-speculate".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_speculative_retry__after__speculate_desc.
Module mapreduce_job_speculative_retry__after__speculate := FieldModuleFunctor mapreduce_job_speculative_retry__after__speculate_desc.
Export mapreduce_job_speculative_retry__after__speculate.


Module mapreduce_job_speculative_speculative__cap__running__tasks_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.speculative.speculative-cap-running-tasks".
  Definition mTipe := mTipe_float.
  Definition rType := fun value: R => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_speculative_speculative__cap__running__tasks_desc.
Module mapreduce_job_speculative_speculative__cap__running__tasks := FieldModuleFunctor mapreduce_job_speculative_speculative__cap__running__tasks_desc.
Export mapreduce_job_speculative_speculative__cap__running__tasks.


Module mapreduce_job_speculative_speculative__cap__total__tasks_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.speculative.speculative-cap-total-tasks".
  Definition mTipe := mTipe_float.
  Definition rType := fun value: R => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_speculative_speculative__cap__total__tasks_desc.
Module mapreduce_job_speculative_speculative__cap__total__tasks := FieldModuleFunctor mapreduce_job_speculative_speculative__cap__total__tasks_desc.
Export mapreduce_job_speculative_speculative__cap__total__tasks.


Module mapreduce_job_split_metainfo_maxsize_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.split.metainfo.maxsize".
  Definition mTipe := mTipe_Z.
  Definition rType := fun value: Z => (Z.eq value (-1%Z)) \/ value > 0.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_split_metainfo_maxsize_desc.
Module mapreduce_job_split_metainfo_maxsize := FieldModuleFunctor mapreduce_job_split_metainfo_maxsize_desc.
Export mapreduce_job_split_metainfo_maxsize.


Module mapreduce_job_ubertask_enable_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.ubertask.enable".
  Definition mTipe := mTipe_bool.
  Definition rType := fun value: bool => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_ubertask_enable_desc.
Module mapreduce_job_ubertask_enable := FieldModuleFunctor mapreduce_job_ubertask_enable_desc.
Export mapreduce_job_ubertask_enable.


Module mapreduce_job_ubertask_maxmaps_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.ubertask.maxmaps".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_ubertask_maxmaps_desc.
Module mapreduce_job_ubertask_maxmaps := FieldModuleFunctor mapreduce_job_ubertask_maxmaps_desc.
Export mapreduce_job_ubertask_maxmaps.


Module mapreduce_job_ubertask_maxreduces_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.ubertask.maxreduces".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_ubertask_maxreduces_desc.
Module mapreduce_job_ubertask_maxreduces := FieldModuleFunctor mapreduce_job_ubertask_maxreduces_desc.
Export mapreduce_job_ubertask_maxreduces.


Module mapreduce_jobtracker_expire_trackers_interval_desc <: FieldModuleType.
  Definition fName := "mapreduce.jobtracker.expire.trackers.interval".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_jobtracker_expire_trackers_interval_desc.
Module mapreduce_jobtracker_expire_trackers_interval := FieldModuleFunctor mapreduce_jobtracker_expire_trackers_interval_desc.
Export mapreduce_jobtracker_expire_trackers_interval.


Module mapreduce_jobtracker_handler_count_desc <: FieldModuleType.
  Definition fName := "mapreduce.jobtracker.handler.count".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_jobtracker_handler_count_desc.
Module mapreduce_jobtracker_handler_count := FieldModuleFunctor mapreduce_jobtracker_handler_count_desc.
Export mapreduce_jobtracker_handler_count.


Module mapreduce_jobtracker_maxtasks_perjob_desc <: FieldModuleType.
  Definition fName := "mapreduce.jobtracker.maxtasks.perjob".
  Definition mTipe := mTipe_Z.
  Definition rType := fun value: Z => (Z.eq value (-1%Z)) \/ value > 0.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_jobtracker_maxtasks_perjob_desc.
Module mapreduce_jobtracker_maxtasks_perjob := FieldModuleFunctor mapreduce_jobtracker_maxtasks_perjob_desc.
Export mapreduce_jobtracker_maxtasks_perjob.


Module mapreduce_jobtracker_taskcache_levels_desc <: FieldModuleType.
  Definition fName := "mapreduce.jobtracker.taskcache.levels".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_jobtracker_taskcache_levels_desc.
Module mapreduce_jobtracker_taskcache_levels := FieldModuleFunctor mapreduce_jobtracker_taskcache_levels_desc.
Export mapreduce_jobtracker_taskcache_levels.


Module mapreduce_map_cpu_vcores_desc <: FieldModuleType.
  Definition fName := "mapreduce.map.cpu.vcores".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => (Pos.lt value (env_virt_CPU_cores myEnv)).
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_map_cpu_vcores_desc.
Module mapreduce_map_cpu_vcores := FieldModuleFunctor mapreduce_map_cpu_vcores_desc.
Export mapreduce_map_cpu_vcores.


Module mapreduce_map_java_opts_desc <: FieldModuleType.
  Definition fName := "mapreduce.map.java.opts".
  Definition mTipe := mTipe_JavaOpts.
  Definition rType := fun value: string => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_map_java_opts_desc.
Module mapreduce_map_java_opts := FieldModuleFunctor mapreduce_map_java_opts_desc.
Export mapreduce_map_java_opts.


Module mapreduce_map_maxattempts_desc <: FieldModuleType.
  Definition fName := "mapreduce.map.maxattempts".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_map_maxattempts_desc.
Module mapreduce_map_maxattempts := FieldModuleFunctor mapreduce_map_maxattempts_desc.
Export mapreduce_map_maxattempts.


Module mapreduce_map_memory_mb_desc <: FieldModuleType.
  Definition fName := "mapreduce.map.memory.mb".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => Pos.lt value (env_phys_mem_mb myEnv).
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_map_memory_mb_desc.
Module mapreduce_map_memory_mb := FieldModuleFunctor mapreduce_map_memory_mb_desc.
Export mapreduce_map_memory_mb.


Module mapreduce_map_output_compress_desc <: FieldModuleType.
  Definition fName := "mapreduce.map.output.compress".
  Definition mTipe := mTipe_bool.
  Definition rType := fun value: bool => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_map_output_compress_desc.
Module mapreduce_map_output_compress := FieldModuleFunctor mapreduce_map_output_compress_desc.
Export mapreduce_map_output_compress.


Module mapreduce_map_output_compress_codec_desc <: FieldModuleType.
  Definition fName := "mapreduce.map.output.compress.codec".
  Definition mTipe := mTipe_string.
  Definition rType := fun value: string => In value (env_comp_codecs myEnv).
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_map_output_compress_codec_desc.
Module mapreduce_map_output_compress_codec := FieldModuleFunctor mapreduce_map_output_compress_codec_desc.
Export mapreduce_map_output_compress_codec.


Module mapreduce_map_skip_maxrecords_desc <: FieldModuleType.
  Definition fName := "mapreduce.map.skip.maxrecords".
  Definition mTipe := mTipe_N.
  Definition rType := fun value: N => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_map_skip_maxrecords_desc.
Module mapreduce_map_skip_maxrecords := FieldModuleFunctor mapreduce_map_skip_maxrecords_desc.
Export mapreduce_map_skip_maxrecords.


Module mapreduce_map_skip_proc_count_autoincr_desc <: FieldModuleType.
  Definition fName := "mapreduce.map.skip.proc.count.autoincr".
  Definition mTipe := mTipe_bool.
  Definition rType := fun value: bool => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_map_skip_proc_count_autoincr_desc.
Module mapreduce_map_skip_proc_count_autoincr := FieldModuleFunctor mapreduce_map_skip_proc_count_autoincr_desc.
Export mapreduce_map_skip_proc_count_autoincr.


Module mapreduce_map_sort_spill_percent_desc <: FieldModuleType.
  Definition fName := "mapreduce.map.sort.spill.percent".
  Definition mTipe := mTipe_float.
  Definition rType := fun value: R => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_map_sort_spill_percent_desc.
Module mapreduce_map_sort_spill_percent := FieldModuleFunctor mapreduce_map_sort_spill_percent_desc.
Export mapreduce_map_sort_spill_percent.


Module mapreduce_map_speculative_desc <: FieldModuleType.
  Definition fName := "mapreduce.map.speculative".
  Definition mTipe := mTipe_bool.
  Definition rType := fun value: bool => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_map_speculative_desc.
Module mapreduce_map_speculative := FieldModuleFunctor mapreduce_map_speculative_desc.
Export mapreduce_map_speculative.


Module mapreduce_output_fileoutputformat_compress_desc <: FieldModuleType.
  Definition fName := "mapreduce.output.fileoutputformat.compress".
  Definition mTipe := mTipe_bool.
  Definition rType := fun value: bool => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_output_fileoutputformat_compress_desc.
Module mapreduce_output_fileoutputformat_compress := FieldModuleFunctor mapreduce_output_fileoutputformat_compress_desc.
Export mapreduce_output_fileoutputformat_compress.


Module mapreduce_output_fileoutputformat_compress_codec_desc <: FieldModuleType.
  Definition fName := "mapreduce.output.fileoutputformat.compress.codec".
  Definition mTipe := mTipe_string.
  Definition rType := fun value: string => In value (env_comp_codecs myEnv).
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_output_fileoutputformat_compress_codec_desc.
Module mapreduce_output_fileoutputformat_compress_codec := FieldModuleFunctor mapreduce_output_fileoutputformat_compress_codec_desc.
Export mapreduce_output_fileoutputformat_compress_codec.


Module mapreduce_output_fileoutputformat_compress_type_desc <: FieldModuleType.
  Definition fName := "mapreduce.output.fileoutputformat.compress.type".
  Definition mTipe := mTipe_string.
  Definition rType := fun value: string => In value ("NONE"::"RECORD"::"BLOCK"::nil).
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_output_fileoutputformat_compress_type_desc.
Module mapreduce_output_fileoutputformat_compress_type := FieldModuleFunctor mapreduce_output_fileoutputformat_compress_type_desc.
Export mapreduce_output_fileoutputformat_compress_type.


Module mapreduce_reduce_cpu_vcores_desc <: FieldModuleType.
  Definition fName := "mapreduce.reduce.cpu.vcores".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_reduce_cpu_vcores_desc.
Module mapreduce_reduce_cpu_vcores := FieldModuleFunctor mapreduce_reduce_cpu_vcores_desc.
Export mapreduce_reduce_cpu_vcores.


Module mapreduce_reduce_input_buffer_percent_desc <: FieldModuleType.
  Definition fName := "mapreduce.reduce.input.buffer.percent".
  Definition mTipe := mTipe_float.
  Definition rType := fun value: R => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_reduce_input_buffer_percent_desc.
Module mapreduce_reduce_input_buffer_percent := FieldModuleFunctor mapreduce_reduce_input_buffer_percent_desc.
Export mapreduce_reduce_input_buffer_percent.


Module mapreduce_reduce_java_opts_desc <: FieldModuleType.
  Definition fName := "mapreduce.reduce.java.opts".
  Definition mTipe := mTipe_JavaOpts.
  Definition rType := fun value: string => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_reduce_java_opts_desc.
Module mapreduce_reduce_java_opts := FieldModuleFunctor mapreduce_reduce_java_opts_desc.
Export mapreduce_reduce_java_opts.


Module mapreduce_reduce_markreset_buffer_percent_desc <: FieldModuleType.
  Definition fName := "mapreduce.reduce.markreset.buffer.percent".
  Definition mTipe := mTipe_float.
  Definition rType := fun value: R => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_reduce_markreset_buffer_percent_desc.
Module mapreduce_reduce_markreset_buffer_percent := FieldModuleFunctor mapreduce_reduce_markreset_buffer_percent_desc.
Export mapreduce_reduce_markreset_buffer_percent.


Module mapreduce_reduce_maxattempts_desc <: FieldModuleType.
  Definition fName := "mapreduce.reduce.maxattempts".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_reduce_maxattempts_desc.
Module mapreduce_reduce_maxattempts := FieldModuleFunctor mapreduce_reduce_maxattempts_desc.
Export mapreduce_reduce_maxattempts.


Module mapreduce_reduce_memory_mb_desc <: FieldModuleType.
  Definition fName := "mapreduce.reduce.memory.mb".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_reduce_memory_mb_desc.
Module mapreduce_reduce_memory_mb := FieldModuleFunctor mapreduce_reduce_memory_mb_desc.
Export mapreduce_reduce_memory_mb.


Module mapreduce_reduce_merge_inmem_threshold_desc <: FieldModuleType.
  Definition fName := "mapreduce.reduce.merge.inmem.threshold".
  Definition mTipe := mTipe_Z.
  Definition rType := fun value: Z => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_reduce_merge_inmem_threshold_desc.
Module mapreduce_reduce_merge_inmem_threshold := FieldModuleFunctor mapreduce_reduce_merge_inmem_threshold_desc.
Export mapreduce_reduce_merge_inmem_threshold.


Module mapreduce_reduce_shuffle_input_buffer_percent_desc <: FieldModuleType.
  Definition fName := "mapreduce.reduce.shuffle.input.buffer.percent".
  Definition mTipe := mTipe_float.
  Definition rType := fun value: R => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_reduce_shuffle_input_buffer_percent_desc.
Module mapreduce_reduce_shuffle_input_buffer_percent := FieldModuleFunctor mapreduce_reduce_shuffle_input_buffer_percent_desc.
Export mapreduce_reduce_shuffle_input_buffer_percent.


Module mapreduce_reduce_shuffle_memory_limit_percent_desc <: FieldModuleType.
  Definition fName := "mapreduce.reduce.shuffle.memory.limit.percent".
  Definition mTipe := mTipe_float.
  Definition rType := fun value: R => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_reduce_shuffle_memory_limit_percent_desc.
Module mapreduce_reduce_shuffle_memory_limit_percent := FieldModuleFunctor mapreduce_reduce_shuffle_memory_limit_percent_desc.
Export mapreduce_reduce_shuffle_memory_limit_percent.


Module mapreduce_reduce_shuffle_merge_percent_desc <: FieldModuleType.
  Definition fName := "mapreduce.reduce.shuffle.merge.percent".
  Definition mTipe := mTipe_float.
  Definition rType := fun value: R => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_reduce_shuffle_merge_percent_desc.
Module mapreduce_reduce_shuffle_merge_percent := FieldModuleFunctor mapreduce_reduce_shuffle_merge_percent_desc.
Export mapreduce_reduce_shuffle_merge_percent.


Module mapreduce_reduce_shuffle_parallelcopies_desc <: FieldModuleType.
  Definition fName := "mapreduce.reduce.shuffle.parallelcopies".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_reduce_shuffle_parallelcopies_desc.
Module mapreduce_reduce_shuffle_parallelcopies := FieldModuleFunctor mapreduce_reduce_shuffle_parallelcopies_desc.
Export mapreduce_reduce_shuffle_parallelcopies.


Module mapreduce_reduce_shuffle_retry__delay_max_ms_desc <: FieldModuleType.
  Definition fName := "mapreduce.reduce.shuffle.retry-delay.max.ms".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_reduce_shuffle_retry__delay_max_ms_desc.
Module mapreduce_reduce_shuffle_retry__delay_max_ms := FieldModuleFunctor mapreduce_reduce_shuffle_retry__delay_max_ms_desc.
Export mapreduce_reduce_shuffle_retry__delay_max_ms.


Module mapreduce_shuffle_max_connections_desc <: FieldModuleType.
  Definition fName := "mapreduce.shuffle.max.connections".
  Definition mTipe := mTipe_N.
  Definition rType := fun value: N => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_shuffle_max_connections_desc.
Module mapreduce_shuffle_max_connections := FieldModuleFunctor mapreduce_shuffle_max_connections_desc.
Export mapreduce_shuffle_max_connections.


Module mapreduce_shuffle_max_threads_desc <: FieldModuleType.
  Definition fName := "mapreduce.shuffle.max.threads".
  Definition mTipe := mTipe_N.
  Definition rType := fun value: N => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_shuffle_max_threads_desc.
Module mapreduce_shuffle_max_threads := FieldModuleFunctor mapreduce_shuffle_max_threads_desc.
Export mapreduce_shuffle_max_threads.


Module mapreduce_shuffle_transfer_buffer_size_desc <: FieldModuleType.
  Definition fName := "mapreduce.shuffle.transfer.buffer.size".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_shuffle_transfer_buffer_size_desc.
Module mapreduce_shuffle_transfer_buffer_size := FieldModuleFunctor mapreduce_shuffle_transfer_buffer_size_desc.
Export mapreduce_shuffle_transfer_buffer_size.


Module mapreduce_task_combine_progress_records_desc <: FieldModuleType.
  Definition fName := "mapreduce.task.combine.progress.records".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_task_combine_progress_records_desc.
Module mapreduce_task_combine_progress_records := FieldModuleFunctor mapreduce_task_combine_progress_records_desc.
Export mapreduce_task_combine_progress_records.


Module mapreduce_task_io_sort_factor_desc <: FieldModuleType.
  Definition fName := "mapreduce.task.io.sort.factor".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_task_io_sort_factor_desc.
Module mapreduce_task_io_sort_factor := FieldModuleFunctor mapreduce_task_io_sort_factor_desc.
Export mapreduce_task_io_sort_factor.


Module mapreduce_task_io_sort_mb_desc <: FieldModuleType.
  Definition fName := "mapreduce.task.io.sort.mb".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_task_io_sort_mb_desc.
Module mapreduce_task_io_sort_mb := FieldModuleFunctor mapreduce_task_io_sort_mb_desc.
Export mapreduce_task_io_sort_mb.


Module mapreduce_task_merge_progress_records_desc <: FieldModuleType.
  Definition fName := "mapreduce.task.merge.progress.records".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_task_merge_progress_records_desc.
Module mapreduce_task_merge_progress_records := FieldModuleFunctor mapreduce_task_merge_progress_records_desc.
Export mapreduce_task_merge_progress_records.


Module mapreduce_task_profile_maps_desc <: FieldModuleType.
  Definition fName := "mapreduce.task.profile.maps".
  Definition mTipe := mTipe_string.
  Definition rType := fun value: string => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_task_profile_maps_desc.
Module mapreduce_task_profile_maps := FieldModuleFunctor mapreduce_task_profile_maps_desc.
Export mapreduce_task_profile_maps.


Module mapreduce_task_profile_reduces_desc <: FieldModuleType.
  Definition fName := "mapreduce.task.profile.reduces".
  Definition mTipe := mTipe_string.
  Definition rType := fun value: string => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_task_profile_reduces_desc.
Module mapreduce_task_profile_reduces := FieldModuleFunctor mapreduce_task_profile_reduces_desc.
Export mapreduce_task_profile_reduces.


Module mapreduce_tasktracker_http_threads_desc <: FieldModuleType.
  Definition fName := "mapreduce.tasktracker.http.threads".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_tasktracker_http_threads_desc.
Module mapreduce_tasktracker_http_threads := FieldModuleFunctor mapreduce_tasktracker_http_threads_desc.
Export mapreduce_tasktracker_http_threads.


Module mapreduce_tasktracker_indexcache_mb_desc <: FieldModuleType.
  Definition fName := "mapreduce.tasktracker.indexcache.mb".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_tasktracker_indexcache_mb_desc.
Module mapreduce_tasktracker_indexcache_mb := FieldModuleFunctor mapreduce_tasktracker_indexcache_mb_desc.
Export mapreduce_tasktracker_indexcache_mb.


Module mapreduce_tasktracker_map_tasks_maximum_desc <: FieldModuleType.
  Definition fName := "mapreduce.tasktracker.map.tasks.maximum".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_tasktracker_map_tasks_maximum_desc.
Module mapreduce_tasktracker_map_tasks_maximum := FieldModuleFunctor mapreduce_tasktracker_map_tasks_maximum_desc.
Export mapreduce_tasktracker_map_tasks_maximum.


Module mapreduce_tasktracker_reduce_tasks_maximum_desc <: FieldModuleType.
  Definition fName := "mapreduce.tasktracker.reduce.tasks.maximum".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_tasktracker_reduce_tasks_maximum_desc.
Module mapreduce_tasktracker_reduce_tasks_maximum := FieldModuleFunctor mapreduce_tasktracker_reduce_tasks_maximum_desc.
Export mapreduce_tasktracker_reduce_tasks_maximum.


Module mapreduce_tasktracker_taskmemorymanager_monitoringinterval_desc <: FieldModuleType.
  Definition fName := "mapreduce.tasktracker.taskmemorymanager.monitoringinterval".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_tasktracker_taskmemorymanager_monitoringinterval_desc.
Module mapreduce_tasktracker_taskmemorymanager_monitoringinterval := FieldModuleFunctor mapreduce_tasktracker_taskmemorymanager_monitoringinterval_desc.
Export mapreduce_tasktracker_taskmemorymanager_monitoringinterval.


Module mapreduce_job_reducer_unconditional__preempt_delay_sec_desc <: FieldModuleType.
  Definition fName := "mapreduce.job.reducer.unconditional-preempt.delay.sec".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End mapreduce_job_reducer_unconditional__preempt_delay_sec_desc.
Module mapreduce_job_reducer_unconditional__preempt_delay_sec := FieldModuleFunctor mapreduce_job_reducer_unconditional__preempt_delay_sec_desc.
Export mapreduce_job_reducer_unconditional__preempt_delay_sec.
