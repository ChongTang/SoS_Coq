Require Import String.
Open Scope string_scope.
Require util.

(*
The ENVCondition is environment condition type.
For now, it has two components: 
1. number of cpu cores
2. physical memory allocated to Hadoop.
*)
Record ENVCondition := mk_condition {
  total_cpu: nat
  ;total_phy_mem: nat  (*unit in M*)
}.