# Formal coverage

## Frozen target

Source: [`THEOREM_AND_PROOF.md`](../THEOREM_AND_PROOF.md), baseline commit `8b151a0f59c1e51c067d89e4b7f7e7878e40172c`.
The definitions and theorem hypotheses in `Transient.lean` are the acceptance target.
The pinned Lean/Mathlib build and strict axiom audit must pass before treating a
statement as machine-checked. The workflow records the exact tested commit/run.

## Statements covered

For A>0 and tau>0: the exact derivative, peak in the first-lobe interior, derivative signs on either side, unique interior critical point, strict global maximum on [0,tau] and the exact peak-value formula.

## Limits and unresolved obligations

This proves the specified damped sine waveform theorem. It does not establish that neutron-star glitches follow this waveform or that any proposed physical mechanism or numerical calibration is correct.

## Evidence discipline

These are established algebra, analysis and finite-dimensional mathematics,
not a novelty claim. Formal proofs establish only their stated hypotheses and
conclusions. Computational regression tests are software checks, not independent
experimental evidence. No theorem uses a claimed physical interpretation as a
premise. No custom axioms, `sorry`, or native-evaluation trust exception is allowed.
No new animal operation is invented or claimed to have been executed.

The first evidence status is **unresolved** until the exact-commit workflow
succeeds; thereafter only the covered formal statements are **demonstrated**.
Scientific applicability remains a **hypothesis/postulate** unless separately tested.
