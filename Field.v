Section Fields.
  Parameter F : Set.
  Parameter one : F.
  Parameter zero : F.
  Parameter add : F -> F -> F.
  Parameter mul : F -> F -> F.
  Notation "x + y" := (add x y).
  Notation "x * y" := (mul x y).
  
  Definition Operation := F -> F -> F.

  Definition Associative (f : Operation) :=
    forall (a b c : F),
      f a (f b c) = f (f a b) c.

  Definition Commutative (f : Operation) :=
    forall (a b : F),
      f a b = f b a.
  Definition IsIdentity (f : Operation) (id : F) :=
    forall (b : F),
      f id b = b.
  Definition AdditiveInverses :=
    forall (a : F),
      exists (b : F),
        a + b = zero.
  Definition MultiplicativeInverses :=
    forall (a : F),
      a <> zero ->
        exists (b : F),
          a * b = one.
  Definition Distributive (f : Operation) (g : Operation) :=
    forall (a x y : F),
      a * (x + y) = (a * x) + (a * y).
  Record Field : Type := {
      AssocAdd : Associative add;
      AssocMul : (Associative mul);
      CommAdd : (Commutative add);
      CommMul : (Commutative mul);
      ZeroIdentity : (IsIdentity add zero);
      OneIdentity : (IsIdentity mul one);
      InvAdd : AdditiveInverses;
      InvMult : MultiplicativeInverses;
      Dist : (Distributive mul add)
    }.