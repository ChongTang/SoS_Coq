Require Export fieldType.
Require Import env_desc.
Require Import Coq.ZArith.Zdiv.
Open Scope string_scope.
Open Scope Z_scope.
Open Scope positive_scope.

Module io_file_buffer_size_desc <: FieldModuleType.
  Definition fName := "io.file.buffer.size".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => ((Zpos value) mod 4096%Z) = 0%Z.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End io_file_buffer_size_desc.
Module io_file_buffer_size := FieldModuleFunctor io_file_buffer_size_desc.
Export io_file_buffer_size.


Module io_map_index_interval_desc <: FieldModuleType.
  Definition fName := "io.map.index.interval".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End io_map_index_interval_desc.
Module io_map_index_interval := FieldModuleFunctor io_map_index_interval_desc.
Export io_map_index_interval.


Module io_map_index_skip_desc <: FieldModuleType.
  Definition fName := "io.map.index.skip".
  Definition mTipe := mTipe_N.
  Definition rType := fun value: N => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End io_map_index_skip_desc.
Module io_map_index_skip := FieldModuleFunctor io_map_index_skip_desc.
Export io_map_index_skip.


Module io_seqfile_compress_blocksize_desc <: FieldModuleType.
  Definition fName := "io.seqfile.compress.blocksize".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End io_seqfile_compress_blocksize_desc.
Module io_seqfile_compress_blocksize := FieldModuleFunctor io_seqfile_compress_blocksize_desc.
Export io_seqfile_compress_blocksize.


Module io_seqfile_sorter_recordlimit_desc <: FieldModuleType.
  Definition fName := "io.seqfile.sorter.recordlimit".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End io_seqfile_sorter_recordlimit_desc.
Module io_seqfile_sorter_recordlimit := FieldModuleFunctor io_seqfile_sorter_recordlimit_desc.
Export io_seqfile_sorter_recordlimit.


Module ipc_maximum_data_length_desc <: FieldModuleType.
  Definition fName := "ipc.maximum.data.length".
  Definition mTipe := mTipe_pos.
  Definition rType := fun value: positive => True.
  Definition fUnit := "".
  Definition fInterp := "".
  Definition fAdvice := "".
End ipc_maximum_data_length_desc.
Module ipc_maximum_data_length := FieldModuleFunctor ipc_maximum_data_length_desc.
Export ipc_maximum_data_length.
