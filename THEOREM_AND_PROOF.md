# Peak-Time Theorem for the EFMW Glitch Transient

## Theorem

Let

\[
f(t)=A e^{-t/\tau}\sin\left(\frac{\pi t}{\tau}\right)
\]

with \(A>0\) and \(\tau>0\). Restricted to the first positive lobe \(0\le t\le\tau\),

1. \(f\) has a unique interior critical point;
2. that critical point is the strict global maximum on \([0,\tau]\);
3. its location is

\[
\boxed{
t_*=\frac{\tau}{\pi}\arctan\pi
}
\]

and

4. the maximum value is

\[
\boxed{
f(t_*)=
A e^{-\arctan(\pi)/\pi}
\frac{\pi}{\sqrt{1+\pi^2}}
}.
\]

Numerically,

\[
t_*/\tau\approx0.401906738,\qquad
f(t_*)/A\approx0.638.
\]

## Proof

Differentiate:

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

Because \(A>0\), \(\tau>0\), and the exponential is positive, the sign of \(f'(t)\) is the sign of

\[
g(x)=\pi\cos x-\sin x,
\qquad x=\frac{\pi t}{\tau}.
\]

For \(t\in(0,\tau)\), \(x\in(0,\pi)\). A critical point satisfies

\[
\pi\cos x-\sin x=0.
\]

Where \(\cos x\ne0\), this is equivalent to

\[
\tan x=\pi.
\]

Since \(\pi>0\), the only solution in \(x\in(0,\pi)\) is

\[
x_*=\arctan\pi,
\]

because \(\tan x\) is strictly increasing on \((0,\pi/2)\), while \(\tan x<0\) on \((\pi/2,\pi)\).

Thus

\[
t_*=\frac{\tau}{\pi}\arctan\pi.
\]

Moreover \(g(0)=\pi>0\) and \(g(\pi)=-\pi<0\), and there is only one zero. Therefore \(f'\) is positive before \(t_*\) and negative after \(t_*\). Since \(f(0)=f(\tau)=0\), \(t_*\) is the strict global maximum on \([0,\tau]\).

Let \(\theta=\arctan\pi\). Then \(\tan\theta=\pi\), so

\[
\sin\theta=\frac{\pi}{\sqrt{1+\pi^2}}.
\]

Also \(t_*/\tau=\theta/\pi\). Therefore

\[
f(t_*)
=
A e^{-\theta/\pi}\sin\theta
=
A e^{-\arctan(\pi)/\pi}
\frac{\pi}{\sqrt{1+\pi^2}}.
\]

This proves the theorem. ∎

## Corollary: normalized falsification target

For every zero-phase instance of this transient,

\[
\frac{t_{\mathrm{peak}}}{\tau}
=
\frac{\arctan\pi}{\pi},
\]

and

\[
\frac{f(t_{\mathrm{peak}})}{A}
=
e^{-\arctan(\pi)/\pi}
\frac{\pi}{\sqrt{1+\pi^2}}.
\]

These are parameter-free predictions of the normalized waveform shape.
