
Definition doit3times {T: Type} (f: T -> T) (n: T): T :=
 f (f (f n)).

Check @doit3times.


Definition minustwo (n: nat): nat :=
 match n with 
 | O => O
 | S O => O
 | S (S x) => x
 end.

Compute minustwo 5.

Example test_doitetimes: doit3times minustwo 8 = 2.
Proof. reflexivity. Qed.


Inductive list {T: Type}: Type :=
 | nil
 | cons (x: T) (l: list).


Fixpoint filter {T: Type} (cond: T -> bool) (lst: list): list :=
 match lst with
 | nil => nil
 | cons a lst => if cond a then (cons a (filter cond lst)) 
                  else (filter cond lst)
 end.


Definition notb (b: bool): bool :=
 match b with
 | true => false 
 | false => true
end.

Fixpoint iseven (n: nat): bool :=
 match n with
 | O => true
 | S O => false
 | S x => notb (iseven x)
end.

Definition isodd (n: nat): bool := notb (iseven n).


Compute filter iseven (cons 1 (cons 2 (cons 3 nil))).
Compute filter isodd (cons 1 (cons 2 (cons 3 nil))).
 
Example test_filter1: filter iseven (cons 1 (cons 2 (cons 3 nil))) = (cons 2 nil).
Proof. reflexivity. Qed.
Example test_filter2: filter isodd (cons 1 (cons 2 (cons 3 nil))) = (cons 1 (cons 3 nil)).
Proof. reflexivity. Qed.


Example test_anonymous_func: 
 doit3times (fun n => n + n) 3 = 24.
Proof. reflexivity. Qed.











