Require Import String.
Open Scope string_scope.
Require Export util.

(*Configuration for Hadoop Core sub-component*)
Record HadoopCoreConfig := mk_hadoop_core_config {
   io_compression_codecs: string
  ;io_file_buffer_size: nat
  ;io_map_index_interval: nat
  ;io_map_index_skip: nat
  ;io_seqfile_compress_blocksize: nat
  ;io_seqfile_sorter_recordlimit: nat
  ;ipc_maximum_data_length: nat
}.
