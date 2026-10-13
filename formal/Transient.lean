import Mathlib

namespace Transient
open Real Set

noncomputable def transient (A τ t : ℝ) : ℝ := A * exp (-t/τ) * sin (π*t/τ)
noncomputable def peak (τ : ℝ) : ℝ := τ / π * arctan π

theorem transient_derivative (A τ t : ℝ) :
    HasDerivAt (transient A τ)
      (A/τ * exp (-t/τ) * (π*cos (π*t/τ) - sin (π*t/τ))) t := by
  have he := (((hasDerivAt_id t).neg.div_const τ).exp.const_mul A)
  have hs := (((hasDerivAt_id t).const_mul π).div_const τ).sin
  convert he.mul hs using 1 <;> dsimp [transient] <;> ring

theorem peak_phase (τ : ℝ) (hτ : τ ≠ 0) : π * peak τ / τ = arctan π := by
  unfold peak
  field_simp [hτ, pi_ne_zero]

theorem peak_interior (τ : ℝ) (hτ : 0 < τ) : peak τ ∈ Ioo 0 τ := by
  have hθ : 0 < arctan π := arctan_pos.mpr pi_pos
  have hθπ : arctan π < π := by linarith [arctan_lt_pi_div_two π, pi_pos]
  constructor
  · exact mul_pos (div_pos hτ pi_pos) hθ
  · have h := mul_lt_mul_of_pos_left ((div_lt_one pi_pos).mpr hθπ) hτ
    simpa [peak, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using h

private theorem phase_identity (x : ℝ) :
    (π*cos x - sin x) * cos (arctan π) = sin (arctan π - x) := by
  rw [sin_sub, sin_arctan, cos_arctan]
  ring

private theorem phase_positive (x : ℝ) (hx : 0 ≤ x) (hθ : x < arctan π) :
    0 < π*cos x - sin x := by
  have hs := sin_pos_of_pos_of_lt_pi (sub_pos.mpr hθ)
    (show arctan π-x < π by linarith [arctan_lt_pi_div_two π, pi_pos])
  rw [← phase_identity] at hs
  exact (mul_pos_iff_of_pos_right (cos_arctan_pos π)).mp hs

private theorem phase_negative (x : ℝ) (hθ : arctan π < x) (hx : x ≤ π) :
    π*cos x - sin x < 0 := by
  have hs := sin_neg_of_neg_of_neg_pi_lt (sub_neg.mpr hθ)
    (show -π < arctan π-x by linarith [arctan_pos.mpr pi_pos])
  rw [← phase_identity] at hs
  by_contra hn
  have hnn : 0 ≤ π*cos x - sin x := le_of_not_gt hn
  have hp := mul_nonneg hnn (cos_arctan_pos π).le
  linarith

theorem derivative_positive (A τ t : ℝ) (hA : 0 < A) (hτ : 0 < τ)
    (ht : 0 ≤ t) (hlt : t < peak τ) : 0 < deriv (transient A τ) t := by
  rw [(transient_derivative A τ t).deriv]
  have hphase := div_lt_div_of_pos_right (mul_lt_mul_of_pos_left hlt pi_pos) hτ
  rw [peak_phase τ hτ.ne'] at hphase
  exact mul_pos (mul_pos (div_pos hA hτ) (exp_pos _))
    (phase_positive _ (by positivity) hphase)

theorem derivative_negative (A τ t : ℝ) (hA : 0 < A) (hτ : 0 < τ)
    (hlt : peak τ < t) (ht : t ≤ τ) : deriv (transient A τ) t < 0 := by
  rw [(transient_derivative A τ t).deriv]
  have hphase := div_lt_div_of_pos_right (mul_lt_mul_of_pos_left hlt pi_pos) hτ
  rw [peak_phase τ hτ.ne'] at hphase
  have htop : π*t/τ ≤ π := (div_le_iff₀ hτ).mpr (by nlinarith [pi_pos])
  exact mul_neg_of_pos_of_neg (mul_pos (div_pos hA hτ) (exp_pos _))
    (phase_negative _ hphase htop)

theorem peak_critical (A τ : ℝ) (hτ : 0 < τ) : deriv (transient A τ) (peak τ) = 0 := by
  rw [(transient_derivative A τ (peak τ)).deriv, peak_phase τ hτ.ne',
    cos_arctan, sin_arctan]
  ring

theorem unique_critical (A τ t : ℝ) (hA : 0 < A) (hτ : 0 < τ)
    (ht : t ∈ Ioo 0 τ) : deriv (transient A τ) t = 0 ↔ t = peak τ := by
  constructor
  · intro hz
    rcases lt_trichotomy t (peak τ) with hlt | heq | hgt
    · have := derivative_positive A τ t hA hτ ht.1.le hlt; linarith
    · exact heq
    · have := derivative_negative A τ t hA hτ hgt ht.2.le; linarith
  · rintro rfl
    exact peak_critical A τ hτ

theorem strict_global_maximum (A τ t : ℝ) (hA : 0 < A) (hτ : 0 < τ)
    (ht : t ∈ Icc 0 τ) (hne : t ≠ peak τ) :
    transient A τ t < transient A τ (peak τ) := by
  have hp := peak_interior τ hτ
  have hc : Continuous (transient A τ) := by
    unfold transient
    fun_prop
  rcases lt_or_gt_of_ne hne with hlt | hgt
  · have hm : StrictMonoOn (transient A τ) (Icc 0 (peak τ)) := by
      apply strictMonoOn_of_deriv_pos (convex_Icc _ _) hc.continuousOn
      intro x hx
      rw [interior_Icc] at hx
      exact derivative_positive A τ x hA hτ hx.1.le hx.2
    exact hm ⟨ht.1,hlt.le⟩ ⟨hp.1.le,le_rfl⟩ hlt
  · have hm : StrictAntiOn (transient A τ) (Icc (peak τ) τ) := by
      apply strictAntiOn_of_deriv_neg (convex_Icc _ _) hc.continuousOn
      intro x hx
      rw [interior_Icc] at hx
      exact derivative_negative A τ x hA hτ hx.1 hx.2.le
    exact hm ⟨le_rfl,hp.2.le⟩ ⟨hgt.le,ht.2⟩ hgt

theorem peak_value (A τ : ℝ) (hτ : 0 < τ) :
    transient A τ (peak τ) =
      A * exp (-arctan π / π) * π / sqrt (1 + π^2) := by
  unfold transient
  rw [peak_phase τ hτ.ne', sin_arctan]
  have he : -peak τ / τ = -arctan π / π := by unfold peak; field_simp [hτ.ne', pi_ne_zero]
  rw [he]
  ring

end Transient
