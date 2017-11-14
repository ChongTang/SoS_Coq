Require Import String.
Open Scope string_scope.
Require Import util.
Require Import env_condition.

(*Define another resource manager and suppose there is only one parameter "param1"*)
Record OtherRMConfig (cdt: ENVCondition) := mk_other_rm_config {
  param1: nat
}.