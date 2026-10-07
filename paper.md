# A Damped Resonant Transient Model for Pulsar Glitches

## Matthew Chenoweth Wright with analytical contribution by GPT-5.6 Sol

### Abstract

A proposed model for neutron-star glitches takes the form

\[
\Omega(t)=\Omega_0+N\Delta\Omega\,e^{-t/\tau}\sin\left(\frac{\pi t}{\tau}\right).
\]

The expression combines exponential relaxation with a sinusoidal transient. In its original interpretation, the multiplicative factor \(N\) was associated with neutron-decay events and the \(\pi\)-dependent term was described as a resonant failure mode.

This paper separates what follows mathematically from what remains a physical hypothesis. We derive an exact prediction of the waveform: on the first positive lobe, the transient reaches its unique maximum at

\[
t_*=\frac{\tau}{\pi}\arctan\pi\approx0.401907\,\tau,
\]

with peak amplitude

\[
\Delta\Omega_{\max}
=
A e^{-\arctan(\pi)/\pi}
\frac{\pi}{\sqrt{1+\pi^2}}
\approx0.638\,A,
\]

where \(A=N\Delta\Omega\) or, more generally, any fitted transient amplitude.

The original expression is better interpreted as a candidate transient component than as a complete glitch model, because it begins with zero offset, rises smoothly, returns to zero at \(t=\tau\), and changes sign afterward. We therefore propose a falsifiable observational model consisting of secular spin-down, a persistent glitch step, and the damped resonant transient. The neutron-decay interpretation remains unverified and requires a microphysical mechanism compatible with dense beta-equilibrated neutron-star matter.

---

## 1. Original proposal

The proposed glitch waveform is

\[
\Omega_{\mathrm{final}}(t)
=
\Omega_0
+
N\Delta\Omega
e^{-t/\tau}
\sin\left(\frac{\pi t}{\tau}\right).
\]

The intended interpretation is:

- \(\Omega_0\): baseline angular velocity;
- \(N\): number or effective measure of microscopic events;
- \(\Delta\Omega\): angular-velocity contribution associated with those events;
- \(\tau\): relaxation timescale;
- \(e^{-t/\tau}\): decay envelope;
- \(\sin(\pi t/\tau)\): resonant transient.

The physical proposal is that microscopic instability accumulates and drives macroscopic rotational stress release.

The mathematical and physical claims must be separated. The waveform can be analyzed exactly without assuming any neutron-decay mechanism.

---

## 2. Mathematical reduction

Define the transient

\[
f(t)=A e^{-t/\tau}\sin\left(\frac{\pi t}{\tau}\right),
\qquad A>0,\;\tau>0.
\]

Its derivative is

\[
f'(t)
=
\frac{A}{\tau}e^{-t/\tau}
\left[
\pi\cos\left(\frac{\pi t}{\tau}\right)
-
\sin\left(\frac{\pi t}{\tau}\right)
\right].
\]

An interior critical point therefore satisfies

\[
\pi\cos x-\sin x=0,
\qquad x=\frac{\pi t}{\tau}.
\]

Hence

\[
\tan x=\pi.
\]

On the first positive lobe, \(0<x<\pi\), the only solution is

\[
x_*=\arctan\pi,
\]

which gives

\[
t_*=\frac{\tau}{\pi}\arctan\pi.
\]

Numerically,

\[
\frac{t_*}{\tau}\approx0.401907.
\]

At that point,

\[
\sin(\arctan\pi)=\frac{\pi}{\sqrt{1+\pi^2}},
\]

so the peak is

\[
f(t_*)
=
A
e^{-\arctan(\pi)/\pi}
\frac{\pi}{\sqrt{1+\pi^2}}
\approx0.638\,A.
\]

This is an exact, testable prediction of the waveform.

---

## 3. What the equation does and does not model

A conventional pulsar glitch includes a sudden positive change in rotation frequency, frequently followed by recovery components.

The transient above does not by itself generate a permanent step:

- \(f(0)=0\);
- \(f(t)>0\) on \(0<t<\tau\);
- \(f(\tau)=0\);
- the sinusoid changes sign for \(t>\tau\).

Therefore the expression is naturally interpreted as a transient superposed on a standard glitch step, not as the entire post-glitch angular velocity.

A more complete model is

\[
\Omega(t)
=
\Omega_{\mathrm{sd}}(t)
+
\Delta\Omega_p H(t-t_g)
+
\Delta\Omega_q
e^{-(t-t_g)/\tau_q}
\sin\left[
\pi\frac{t-t_g}{\tau_q}+\phi
\right]
H(t-t_g),
\]

where:

- \(\Omega_{\mathrm{sd}}(t)\) is secular spin-down;
- \(t_g\) is the glitch epoch;
- \(\Delta\Omega_p\) is the persistent step;
- \(\Delta\Omega_q\) is the resonant transient amplitude;
- \(\tau_q\) is its damping/resonance timescale;
- \(\phi\) permits a phase offset;
- \(H\) is the Heaviside step function.

---

## 4. Neutron-decay interpretation

The parameter \(N\) cannot simply be interpreted as the number of freely decaying neutrons unless a consistent microscopic coupling is supplied.

If \(N\) is a literal event count, then \(\Delta\Omega\) must be an angular-velocity contribution per microscopic event. If \(\Delta\Omega\) already denotes the observed glitch magnitude, multiplying by \(N\) double-counts the amplitude.

More importantly, neutron-star interiors are dense many-body systems. A valid decay-linked mechanism would need to specify:

1. the relevant weak-interaction channel;
2. the departure from beta equilibrium, if any;
3. the phase-space and degeneracy constraints;
4. the angular-momentum transfer mechanism;
5. the relation between the microscopic reaction rate and the macroscopic timescale \(\tau_q\).

Until those are provided, neutron decay remains a hypothesis rather than a conclusion of the waveform.

---

## 5. A falsifiable test

The strongest version of the proposal is a model-comparison experiment.

### Null model

Use a conventional post-glitch recovery:

\[
\Delta\Omega_{\mathrm{null}}(t)
=
\Delta\Omega_p+
\sum_i \Delta\Omega_i e^{-(t-t_g)/\tau_i}.
\]

### Resonant model

Add the proposed transient:

\[
\Delta\Omega_{\mathrm{res}}(t)
=
\Delta\Omega_{\mathrm{null}}(t)
+
\Delta\Omega_q
e^{-(t-t_g)/\tau_q}
\sin\left[
\pi\frac{t-t_g}{\tau_q}+\phi
\right].
\]

### Prespecified prediction

For the zero-phase form, the positive transient must peak at

\[
\boxed{
\frac{t_{\mathrm{peak}}-t_g}{\tau_q}
=
\frac{\arctan\pi}{\pi}
\approx0.401907
}
\]

and its peak must equal approximately \(0.638\Delta\Omega_q\).

A genuine test should compare predictive performance, not merely whether a flexible fit can mimic an observed curve.

---

## 6. Interpretation of a positive result

A statistically superior resonant fit would establish evidence for a damped oscillatory component.

It would **not by itself prove neutron decay**.

To support the neutron-decay mechanism, the fitted timescale or amplitude must also be independently predicted from neutron-star microphysics and reproduce the same relation across multiple glitches or pulsars.

---

## 7. Interpretation of a negative result

If high-cadence data do not show the predicted normalized peak timing or if standard recovery models consistently outperform the resonant model out of sample, the proposed waveform should be rejected or revised.

This makes the hypothesis scientifically useful even if it fails.

---

## 8. Conclusion

The proposed neutron-star glitch equation contains a mathematically precise damped resonant transient. Its strongest immediately testable consequence is not the assertion of neutron decay, but an exact waveform prediction:

\[
t_{\mathrm{peak}}
=
\frac{\tau}{\pi}\arctan\pi
\]

with peak factor

\[
e^{-\arctan(\pi)/\pi}
\frac{\pi}{\sqrt{1+\pi^2}}
\approx0.638.
\]

The appropriate next step is a prespecified comparison against real glitch-recovery data, followed separately by a microphysical test of the neutron-decay interpretation.
