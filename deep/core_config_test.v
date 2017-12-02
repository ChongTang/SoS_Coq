Require Import core_config.
Require Import env_desc.
Require Import Omega.

(*
Here's an example of a core configuration given with
explicit proof terms (all [I]: the properties are just True).

Definition a_core_config: hadoop_core_config :=
  mk_hadoop_core_config
    (* field values *)
    (io_compression_codecs.mk  false "aCodecClassName, anotherCodecClassName" I)
    (io_file_buffer_size.mk            false 4096%Z I)
    (io_map_index_interval.mk     false 128%Z I)
    (io_fake_bool.mk                    false false I)

    (* proofs of constraint satisfaction *)
.
*)

(*
(* Here are examples of accessing field names and values *)
Compute io_file_buffer_size.name. (* module name dot property name *)
Compute io_file_buffer_size.value a_core_config.(io_file_buffer_size).
(* module dot property to get value function, applied to structure dot field name *)
(* A little confusing: io_file_buffer_size is both module and field name *)
Compute io_compression_codecs.value a_core_config.(io_compression_codecs).
*)

(*
It's also possible to use interactive proof mode
to construct the proofs interactively. The idea is to
"refine" a configuration with "holes" where the proofs
belong, then to use additional tactics to provide the
required proofs. Here all three proofs are just "I" (the
trivial proof of True), and so its easy to provide them
all at once using Coq's [;] tactical.
*)
Definition a_core_config: CoreConfig. (* page size env parameter *)
Proof.
refine (
    mk_core_config
    (io_file_buffer_size.mk            false 65536%positive _)
    (io_map_index_interval.mk     false 128%positive _)
    (io_map_index_skip.mk         false 0%N _)
    (io_seqfile_compress_blocksize.mk  false 1000000%positive _)
    (io_seqfile_sorter_recordlimit.mk  false 1000000%positive _)
    (ipc_maximum_data_length.mk        false 67108864%positive _)
); try (exact I).
Qed.

(*
intro; inversion H.
Unshelve.
unfold io_file_buffer_size_desc.rType. omega.
unfold io_fake_bool_desc.rType. exact I.
Qed.
*)
Print a_core_config.

(*
  io_file_buffer_size: io_file_buffer_size.ftype
 ;io_map_index_interval: io_map_index_interval.ftype
 ;io_map_index_skip: io_map_index_skip.ftype
 ;io_seqfile_compress_blocksize: io_seqfile_compress_blocksize.ftype
 ;io_seqfile_sorter_recordlimit: io_seqfile_sorter_recordlimit.ftype
 ;ipc_maximum_data_length: ipc_maximum_data_length.ftype
*)
