# EFMW Neutron-Star Glitch Resonance

<!-- ENUMINOUS-NETWORK:START -->
**eNuminous network:** [All repositories](https://enuminous.github.io/EFMW/repositories.html) · [EFMW](https://enuminous.github.io/EFMW/) · [102 equations](https://github.com/enuminous/Monolithic_102_EFMW) · [165 triplets](https://enuminous.github.io/FieldSpace/) · [Zoo](https://enuminous.github.io/Tortoise/) · [Lean](https://enuminous.github.io/Aristotle-102-Monolithic-Lean/) · [Engine](https://enuminous.github.io/Archimedes-Engine/) · [Papers](https://enuminous.github.io/medium/papers-essays-index.html) · [Audit](https://github.com/enuminous/EFMW_Post156_Zoo_Audit/blob/main/portfolio/INTERLOCK_AUDIT.md)

[Repository](https://github.com/enuminous/EFMW-Neutron-Star-Glitch-Resonance) · [Published page](https://enuminous.github.io/EFMW-Neutron-Star-Glitch-Resonance/)

<details>
<summary>Recent repositories (9)</summary>

- [Oroboros](https://github.com/enuminous/Oroboros) · [README](https://github.com/enuminous/Oroboros/blob/main/README.md) · [Page](https://enuminous.github.io/Oroboros/)
- [P-NP](https://github.com/enuminous/P-NP) · [README](https://github.com/enuminous/P-NP/blob/main/README.md) · [Page](https://enuminous.github.io/P-NP/)
- [Research-Program](https://github.com/enuminous/Research-Program) · [README](https://github.com/enuminous/Research-Program/blob/main/README.md) · [Page](https://enuminous.github.io/Research-Program/)
- [I-Have-Guts](https://github.com/enuminous/I-Have-Guts) · [README](https://github.com/enuminous/I-Have-Guts/blob/main/README.md) · [Page](https://enuminous.github.io/I-Have-Guts/)
- [Wrights-Law](https://github.com/enuminous/Wrights-Law) · [README](https://github.com/enuminous/Wrights-Law/blob/main/README.md) · [Page](https://enuminous.github.io/Wrights-Law/)
- [Aristotle-eNuminous](https://github.com/enuminous/Aristotle-eNuminous) · [README](https://github.com/enuminous/Aristotle-eNuminous/blob/main/README.md) · [Page](https://enuminous.github.io/Aristotle-eNuminous/)
- [Multiverse-Simulator](https://github.com/enuminous/Multiverse-Simulator) · [README](https://github.com/enuminous/Multiverse-Simulator/blob/main/README.md) · [Page](https://enuminous.github.io/Multiverse-Simulator/)
- [accelerando-8192](https://github.com/enuminous/accelerando-8192) · [README](https://github.com/enuminous/accelerando-8192/blob/main/README.md) · [Page source](https://github.com/enuminous/accelerando-8192/blob/main/docs/index.html)
- [Codex-888](https://github.com/enuminous/Codex-888) · [README](https://github.com/enuminous/Codex-888/blob/main/README.md) · [Page](https://enuminous.github.io/Codex-888/)

</details>

<details>
<summary>Repository indexes (1)</summary>

- [index.html](https://github.com/enuminous/EFMW-Neutron-Star-Glitch-Resonance/blob/main/index.html) · [Open page](https://enuminous.github.io/EFMW-Neutron-Star-Glitch-Resonance/index.html)

</details>
<!-- ENUMINOUS-NETWORK:END -->

A bounded, falsifiable formulation of a proposed resonant transient in pulsar glitches.

## Core model

The original proposal was

\[
\Omega(t)=\Omega_0+N\Delta\Omega\,e^{-t/\tau}\sin(\pi t/\tau).
\]

This repository separates the **mathematical waveform result** from the **physical neutron-decay hypothesis**.

The recommended observational model is

\[
\Omega(t)=\Omega_{\rm sd}(t)
+\Delta\Omega_p H(t-t_g)
+\Delta\Omega_q e^{-(t-t_g)/\tau_q}
\sin\!\left[\pi\frac{t-t_g}{\tau_q}+\phi\right]H(t-t_g).
\]

The resonant term is a candidate transient. It is not, by itself, evidence that neutron decay causes glitches.

## Exact prediction

For

\[
f(t)=A e^{-t/\tau}\sin(\pi t/\tau),\qquad A>0,\;\tau>0,\;0\le t\le\tau,
\]

the unique interior maximum occurs at

\[
t_*=\frac{\tau}{\pi}\arctan(\pi)
\approx 0.401907\,\tau,
\]

with

\[
f(t_*)=
A\,e^{-\arctan(\pi)/\pi}
\frac{\pi}{\sqrt{1+\pi^2}}
\approx 0.638\,A.
\]

That peak-time ratio is a prespecified, falsifiable prediction of the waveform.

## Contents

- `paper.md` — full paper
- `CONTRIBUTION.md` — separation of the original proposal from the added analysis
- `THEOREM_AND_PROOF.md` — rigorous calculus theorem and proof
- `verify_waveform.py` — reproducible numerical verification
- `claims_boundary.md` — scientific-status boundary
- `CITATION.cff` — citation metadata

## Scientific status

This repository does **not** claim that neutron decay has been demonstrated to govern pulsar glitches.

A successful scientific test would require:
1. high-cadence glitch data;
2. a prespecified fit comparison against standard glitch-recovery models;
3. an independently motivated microphysical timescale;
4. out-of-sample predictive improvement;
5. reproducibility across multiple pulsars.

The mathematical theorem in this repository is independent of those empirical questions.

## Lean 4 verification

The pinned [formal package](formal/VERIFICATION.md) contains kernel-checked mathematical
statements with an explicit [coverage and obligation ledger](formal/COVERAGE.md).
The `Lean verification` workflow builds the package and tests its strict axiom audit.
The workflow result for a commit, rather than this link alone, establishes compilation.
