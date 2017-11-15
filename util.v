Require Import String.
Open Scope string_scope.

(*I define my own float type in Coq*)
Record Float := mk_float {
   before_dot: nat
  ;after_dot: nat
}.

(*A range value is like 0-2 and 3-5, which has two numbers before and after the dash*)
Record Range := mk_range {
   before_dash: nat
  ;after_dash: nat
}.


Inductive JavaOptsUnit := M | G.
Inductive JavaHeapType := Xmx | Xms.

(*
A Java opts is like -Xmx2000M. There are three parts:
1. prefix string: -Xmx
2. integer 2000
3. the unit: M

This is old implementation with prefix.

Record JavaOpts := mk_java_opts {
   mem_prefix: JavaHeapType
  ;heap_size: nat
  ;heap_size_unit: JavaOptsUnit
}.

*)

Record JavaOpts := mk_java_opts {
   heap_size: nat
  ;heap_size_unit: JavaOptsUnit
}.