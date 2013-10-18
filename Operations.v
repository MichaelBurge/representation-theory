Section Operations.
  Variable S : Set.
  Definition Operation := S -> S -> S.
  Definition Associative (f : Operation) :=
    forall (a b c : S),
      f a (f b c) = f (f a b) c.

  Definition Commutative (f : Operation) :=
    forall (a b : S),
      f a b = f b a.

  Definition IsIdentity (f : Operation) (e : S) :=
    forall b : S,
      e = f b e /\ f e b = e.
End Operations.