Require Import Operations.

Section Fields.
  Variable F : Set.
  Variable one : F.
  Variable zero : F.
  Variable add : Operation F.
  Variable mul : Operation F.
  Notation "x + y" := (add x y).
  Notation "x * y" := (mul x y).
  
  Definition AdditiveInverses :=
    forall (a : F),
      exists (b : F),
        a + b = zero.
  Definition MultiplicativeInverses :=
    forall (a : F),
      a <> zero ->
        exists (b : F),
          a * b = one.
  Definition Distributive (f : Operation F) (g : Operation F) :=
    forall (a x y : F),
      a * (x + y) = (a * x) + (a * y).
  Record Field : Type := {
      AssocAdd : Associative F add;
      AssocMul : (Associative F mul);
      CommAdd : (Commutative F add);
      CommMul : (Commutative F mul);
      ZeroIdentity : (IsIdentity F add zero);
      OneIdentity : (IsIdentity F mul one);
      InvAdd : AdditiveInverses;
      InvMult : MultiplicativeInverses;
      Dist : (Distributive mul add)
    }.
End Fields.