Require Import yarn_config.

Inductive ResourceManager := Yarn.

Definition rm_config_type (rm: ResourceManager): Type :=
  match rm with
    | Yarn => YarnConfig
  end.