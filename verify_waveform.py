#!/usr/bin/env python3
import math

pi = math.pi
theta = math.atan(pi)
t_over_tau = theta / pi
peak_over_A = math.exp(-theta/pi) * pi / math.sqrt(1 + pi*pi)

print("EFMW glitch transient exact-shape check")
print(f"t_peak / tau = {t_over_tau:.12f}")
print(f"peak / A      = {peak_over_A:.12f}")

n = 1_000_001
best_t = 0.0
best_y = -1.0
for i in range(n):
    t = i/(n-1)
    y = math.exp(-t) * math.sin(pi*t)
    if y > best_y:
        best_y = y
        best_t = t

print(f"grid t_peak/tau = {best_t:.12f}")
print(f"grid peak/A      = {best_y:.12f}")
print(f"|dt|             = {abs(best_t-t_over_tau):.3e}")
print(f"|dy|             = {abs(best_y-peak_over_A):.3e}")
