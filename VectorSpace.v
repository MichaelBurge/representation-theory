Require Import Field.

Section VectorSpaces.
  Parameter F : Field.
  Parameter V : Type.
  Variable add : V -> V -> V.
  Variable smul : 
  Notation "x + y" := (add x y).
End VectorSpaces.