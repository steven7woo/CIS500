(* bool definition*)
Definition negb (b:bool) : bool
Definition andb (b1:bool) (b2:bool) : bool := 
Definition orb (b1:bool) (b2:bool) : bool := 
Definition nandb (b1:bool) (b2:bool) : bool :=
Definition andb3 (b1:bool) (b2:bool) (b3:bool) : bool :=
(*theorem of bool *)
Theorem andb_true_elim1 : forall b c : bool,
  andb b c = true -> b = true.
Theorem andb_true_elim2 : forall b c : bool,
  andb b c = true -> c = true.

(*nat definition *)
Definition pred (n : nat) : nat :=
Definition minustwo (n : nat) : nat :=
Fixpoint evenb (n:nat) : bool
Definition oddb (n:nat) : bool   :=   negb (evenb n).
Fixpoint plus (n : nat) (m : nat) : nat :=
Fixpoint mult (n m : nat) : nat :=
Fixpoint minus (n m:nat) : nat :=
Fixpoint exp (base power : nat) : nat :=
Fixpoint factorial (n:nat) : nat := 
Notation "x + y" := (plus x y)  
                       (at level 50, left associativity) 
                       : nat_scope.
Notation "x - y" := (minus x y)  
                       (at level 50, left associativity) 
                       : nat_scope.
Notation "x * y" := (mult x y)  
                       (at level 40, left associativity) 
                       : nat_scope.
Fixpoint beq_nat (n m : nat) : bool := n=m
Fixpoint ble_nat (n m : nat) : bool := n<m
Definition blt_nat (n m : nat) : bool :=  n<=m

(* theorem of nat *)
Theorem plus_O_n : forall n : nat, 0 + n = n.
Theorem plus_1_l : forall n:nat, 1 + n = S n. 
Theorem mult_0_l : forall n:nat, 0 * n = 0.
Theorem plus_id_example : forall n m:nat,
  n = m -> 
  n + n = m + m.
Theorem plus_id_exercise : forall n m o : nat,
  n = m -> m = o -> n + m = m + o.
Theorem mult_0_plus : forall n m : nat,
  (0 + n) * m = n * m.
Theorem mult_1_plus : forall n m : nat,
  (1 + n) * m = m + (n * m).
Theorem plus_1_neq_0 : forall n : nat,
  beq_nat (n + 1) 0 = false.
Theorem negb_involutive : forall b : bool,
  negb (negb b) = b.
Theorem zero_nbeq_plus_1 : forall n : nat,
  beq_nat 0 (n + 1) = false.
Theorem identity_fn_applied_twice : 
  forall (f : bool -> bool), 
  (forall (x : bool), f x = x) ->
  forall (b : bool), f (f b) = b.
Theorem andb_eq_orb : 
  forall (b c : bool),
  (andb b c = orb b c) ->
  b = c.
Theorem plus_0_r : forall n:nat, n + 0 = n.
Theorem minus_diag : forall n,
  minus n n = 0.
Theorem mult_0_r : forall n:nat,
  n * 0 = 0.
Theorem plus_n_Sm : forall n m : nat, 
  S (n + m) = n + (S m).
Theorem plus_comm : forall n m : nat,
  n + m = m + n.
Lemma double_plus : forall n, double n = n + n .
Theorem plus_assoc : forall n m p : nat,
  n + (m + p) = (n + m) + p.
Theorem mult_0_plus' : forall n m : nat,
  (0 + n) * m = n * m.
Theorem plus_rearrange : forall n m p q : nat,
  (n + m) + (p + q) = (m + n) + (p + q).
Theorem plus_swap : forall n m p : nat, 
  n + (m + p) = m + (n + p).
Theorem mult_comm : forall m n : nat,
 m * n = n * m.
Theorem evenb_n__oddb_Sn : forall n : nat,
  evenb n = negb (evenb (S n)).
Theorem mult_plus_distr_r : forall n m p : nat,
  (n + m) * p = (n * p) + (m * p).
Theorem mult_assoc : forall n m p : nat,
  n * (m * p) = (n * m) * p.

(*list definition *)
Inductive natprod : Type :=
  pair : nat -> nat -> natprod.
Definition fst (p : natprod) : nat := 
Definition snd (p : natprod) : nat := 
Notation "( x , y )" := (pair x y).
Definition swap_pair (p : natprod) : natprod := 
Inductive natlist : Type :=
  | nil : natlist
  | cons : nat -> natlist -> natlist.
Notation "x :: l" := (cons x l) (at level 60, right associativity).
Notation "[ ]" := nil.
Notation "[ x , .. , y ]" := (cons x .. (cons y nil) ..).
Fixpoint repeat (n count : nat) : natlist := 
Fixpoint length (l:natlist) : nat := 
Fixpoint app (l1 l2 : natlist) : natlist := 
Notation "x ++ y" := (app x y) 
                     (right associativity, at level 60).
Definition hd (default:nat) (l:natlist) : nat := (head nat)
Definition tail (l:natlist) : natlist := (natlist without head)
Fixpoint nonzeros (l:natlist) : natlist :=
Fixpoint oddmembers (l:natlist) : natlist :=
Fixpoint countoddmembers (l:natlist) : nat :=
Fixpoint alternate (l1 l2 : natlist) : natlist :=
Definition bag := natlist.  
Fixpoint count (v:nat) (s:bag) : nat := 
Definition sum : bag -> bag -> bag := 
Definition add (v:nat) (s:bag) : bag := v::s.
Definition member (v:nat) (s:bag) : bool := 
Fixpoint snoc (l:natlist) (v:nat) : natlist :=  (append v to tail)
Fixpoint rev (l:natlist) : natlist := 

Inductive natoption : Type :=
  | Some : nat -> natoption
  | None : natoption.  
Fixpoint index (n:nat) (l:natlist) : natoption := (* return value of index n *)

Fixpoint index' (n:nat) (l:natlist) : natoption :=
  match l with
  | nil => None 
  | a :: l' => if beq_nat n O then Some a else index' (pred n) l'
  end.
Fixpoint beq_natlist (l1 l2 : natlist) : bool :=

Inductive dictionary : Type :=
  | empty  : dictionary 
  | record : nat -> nat -> dictionary -> dictionary. 
(* record key->value->dic *)
Definition insert (key value : nat) (d : dictionary) : dictionary :=
  (record key value d).
Fixpoint find (key : nat) (d : dictionary) : natoption := 


(*theorem of list *)
Theorem surjective_pairing' : forall (n m : nat),
  (n,m) = (fst (n,m), snd (n,m)).
Theorem surjective_pairing : forall (p : natprod),
  p = (fst p, snd p).
Theorem snd_fst_is_swap : forall (p : natprod),
  (snd p, fst p) = swap_pair p.
Theorem fst_swap_is_snd : forall (p : natprod),
  fst (swap_pair p) = snd p.
Theorem nil_app : forall l:natlist,
  [] ++ l = l.
Theorem tl_length_pred : forall l:natlist,
  pred (length l) = length (tail l).
Theorem app_ass : forall l1 l2 l3 : natlist, 
  (l1 ++ l2) ++ l3 = l1 ++ (l2 ++ l3).   
Theorem app_length : forall l1 l2 : natlist, 
  length (l1 ++ l2) = (length l1) + (length l2).
Theorem length_snoc : forall n : nat, forall l : natlist,
  length (snoc l n) = S (length l).
Theorem rev_length : forall l : natlist,
  length (rev l) = length l.
Theorem app_nil_end : forall l : natlist, 
  l ++ [] = l.   
Theorem rev_snoc : forall l :natlist, forall  n : nat,
  rev (snoc l n) = n::rev l. 
Theorem rev_involutive : forall l : natlist,
  rev (rev l) = l.
Theorem app_ass4 : forall l1 l2 l3 l4 : natlist,
  l1 ++ (l2 ++ (l3 ++ l4)) = ((l1 ++ l2) ++ l3) ++ l4.
Theorem snoc_append : forall (l:natlist) (n:nat),
  snoc l n = l ++ [n].
Theorem distr_rev : forall l1 l2 : natlist,
  rev (l1 ++ l2) = (rev l2) ++ (rev l1).
Theorem beq_nat_refl : forall n:nat,
  beq_nat n n = true.
Theorem beq_natlist_refl : forall l:natlist,
  true = beq_natlist l l.
Theorem dictionary_invariant1 : forall (d : dictionary) (k v: nat),
  (find k (insert k v d)) = Some v.
Theorem dictionary_invariant2 : forall (d : dictionary) (m n o: nat),
  (beq_nat m n) = false -> (find m d) = (find m (insert n o d)).

(***************** poly ******************)
Inductive list (X:Type) : Type :=
  | nil : list X (* nil is (list X) type *)
  | cons : X -> list X -> list X.
(*Check cons. 
forall X : Type, X -> list X -> list X
The first X is type, the second X means a variable of Type X 
Each function based on poly need the type parameter following, such cons nat,
length nat etc*)


Fixpoint length (X:Type) (l:list X) : nat :=
Eval simpl in (length nat (cons nat  1  (nil nat))).
(* length has two parameters, first is X:Type 
in this case is nat
second is (list X)
in this case is (cons nat 1 (nil nat)) *)

