Require Import env_desc.
Require Export Coq.ZArith.BinInt.
Require Export String.
Require Import Reals.
Open Scope R_scope.


(*
Representing the range of "machine" types of fields of Hadoop configurations.
*)
Inductive MTipe := mTipe_Z | mTipe_pos | mTipe_N | mTipe_string | mTipe_bool | mTipe_JavaOpts | mTipe_float.

(*
Map MTipes to corresponding native Coq types.
*)
Definition mTypeOfMTipe (mt: MTipe): Type :=
  match mt with
    | mTipe_Z         => Z              (* any integer *)
    | mTipe_pos     => positive    (* positive integers *)
    | mTipe_N         => N             (* non-negative integers *)
    | mTipe_string  => string
    | mTipe_bool    => bool
    | mTipe_JavaOpts => string
    | mTipe_float    => R
  end.

(*
Field is a record type whose values represent fields of Hadoop configuration files.
The Field type is parameterized by a machine type and a property of a value of a
corresponding native Coq type; and it has (record) fields as indicated here: an id,
which must be the actual name of the Hadoop field, a flag indicating whether the
field is to be considered final (true) or not, a value of the native type corresponding
to the tipe, and finally a proof that that value has the specified property (i.e., is of
the specified "real world type," rwt.
*)
Inductive Field (field_mtipe: MTipe) (field_rwt: (mTypeOfMTipe field_mtipe) -> Prop)  := mk_field {
    field_id: string
  ; field_final: bool
  ; field_value: (mTypeOfMTipe field_mtipe)
  ; field_rwt_ok: field_rwt field_value
}.

(*
The next few definitions use the Coq module system to provide mechanisms for easily
specifying the properties of individual Hadoop fields. See the Coq Module Tutorial for
background.
*)

(*
We start by defining a "Module Type", an abstract specification of what a
concrete Field-describing Module must specify. In particular, a module of
this kind must define the Hadoop name of the field, its MTipe, and its real
world type, which is to say, a property of the corresponding Coq native type.
*)
Module Type FieldModuleType.
Parameter fName : string.
Parameter mTipe : MTipe.
Parameter rType : mTypeOfMTipe mTipe -> Prop.
Parameter fUnit : string.
Parameter fInterp : string.
Parameter fAdvice : string.
End FieldModuleType.

(*
Next we specify a "Module Functor", which is module that will take a
concrete module conforming to the just defined abstract specification,
and that constructs a new concrete module with additional definitions,
specialized to the concrete values defined in the concrete module. In
particular, the resulting module will (1) provide a function, [mk], that is
to be used to create field instances specifying finality, a (native) value
of the required type, and a proof that it satisfies the required property;
and (2) a function, type, that returns the (parameterized) Field type.
*)
Module FieldModuleFunctor (FieldModule : FieldModuleType).
Import FieldModule.
Definition mtype := mTypeOfMTipe mTipe.
Definition mk (isFinal: bool) (value: (mTypeOfMTipe mTipe)) (pf: (rType value)) :=
  mk_field mTipe rType fName isFinal value pf.
Definition ftype := Field mTipe rType.
Definition name := fName.
Definition value (f: ftype): mtype := field_value mTipe rType f.
End FieldModuleFunctor.
