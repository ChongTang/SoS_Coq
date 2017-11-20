Require Import String.
Require Export Coq.ZArith.BinInt.
Require Export util.

Open Scope Z_scope.
Open Scope string_scope.

(*Configuration for Hadoop Core sub-component*)
Record HadoopCoreConfig := mk_hadoop_core_config {
   io_compression_codecs: string
  ;io_file_buffer_size: Z
  ;io_map_index_interval: Z
  ;io_map_index_skip: Z
  ;io_seqfile_compress_blocksize: Z
  ;io_seqfile_sorter_recordlimit: Z
  ;ipc_maximum_data_length: Z
}.
