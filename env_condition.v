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

(*This machine has 8 cores and 10240M memory allocated to Hadoop*)
Definition env_condition1 := mk_condition 8 10240. 
Compute (total_cpu env_condition1).