Require Import env_condition.
Require Import yarn_config.
Require Import other_rm.

Inductive ResourceManager := Yarn | OtherRM.

Definition rm_config_type (cdt: ENVCondition) (rm: ResourceManager): Type :=
  match rm with
    | Yarn => YarnConfig cdt
    | OtherRM => OtherRMConfig cdt
  end.