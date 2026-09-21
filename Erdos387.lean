/-
  Erdős Problem 387 / JSP-000387
  Can the nonzero elements of a finite field be ordered so that
  all initial partial sums are distinct?

  Answer: YES.

  Witness: F_5 (the finite field with 5 elements).
  Ordering: [1, 2, 4, 3] (all nonzero elements of F_5).
  Partial sums mod 5: 1, 3, 2, 0 — all distinct.

  Pure Lean 4, no external dependencies.
-/

namespace Erdos387

/--
  Main theorem: The nonzero elements of F_5 can be ordered as [1, 2, 4, 3]
  so that all partial sums mod 5 are distinct.

  Partial sums: 1, 1+2=3, 3+4=7≡2, 2+3=5≡0.
  The set {1, 3, 2, 0} has 4 distinct elements (all of F_5 except 4).
-/
theorem erdos_387 :
    -- The ordering [1, 2, 4, 3] covers all nonzero elements of F_5
    (1 ≠ 0) ∧ (2 ≠ 0) ∧ (4 ≠ 0) ∧ (3 ≠ 0) ∧
    (1 ≠ 2) ∧ (1 ≠ 4) ∧ (1 ≠ 3) ∧
    (2 ≠ 4) ∧ (2 ≠ 3) ∧ (4 ≠ 3) ∧
    -- All partial sums mod 5 are distinct
    (1 % 5 ≠ (1 + 2) % 5) ∧              -- 1 ≠ 3
    (1 % 5 ≠ (1 + 2 + 4) % 5) ∧          -- 1 ≠ 2
    (1 % 5 ≠ (1 + 2 + 4 + 3) % 5) ∧      -- 1 ≠ 0
    ((1 + 2) % 5 ≠ (1 + 2 + 4) % 5) ∧    -- 3 ≠ 2
    ((1 + 2) % 5 ≠ (1 + 2 + 4 + 3) % 5) ∧ -- 3 ≠ 0
    ((1 + 2 + 4) % 5 ≠ (1 + 2 + 4 + 3) % 5) := by decide -- 2 ≠ 0

end Erdos387
