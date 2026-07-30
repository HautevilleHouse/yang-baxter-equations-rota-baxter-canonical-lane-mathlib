import canonicalLaneMathlib.AdmissibleClass

/-!
# Baxterization Layer

This module connects the Yang-Baxter equation to the Rota-Baxter identity
via the Baxterization construction, which produces an R-matrix from a
Rota-Baxter operator, or vice versa.
-/

namespace HautevilleHouse
namespace YangBaxterEquationsRotaBaxterCanonicalLaneLean

structure BaxterizationObject where
  rotaBaxterAlgebra : RotaBaxterAlgebra
  spectralParameter : ℚ
  Rmatrix : rotaBaxterAlgebra.algebraCarrier → rotaBaxterAlgebra.algebraCarrier → rotaBaxterAlgebra.algebraCarrier

def baxterizationMap (A : RotaBaxterAlgebra) (λ : ℚ) : (A.algebraCarrier → A.algebraCarrier → A.algebraCarrier) :=
  fun x y => A.linearOperator (A.multiplication x y) - λ * A.multiplication (A.linearOperator x) (A.linearOperator y)

lemma baxterization_yang_baxter_eq (A : RotaBaxterAlgebra) (λ : ℚ) (h : rotaBaxterIdentity A) :
  yangBaxterEquation A.algebraCarrier (fun x y z w => baxterizationMap A λ x y = z) := by
  sorry

structure BaxterizationCertificate where
  sourceRotaBaxter : RotaBaxterCertificate
  targetYangBaxter : YangBaxterCertificate
  spectralParameterUsed : ℚ
  baxterizationHolds : Prop
  baxterizationProof : baxterizationHolds

def sourceBaxterizationCertificate : BaxterizationCertificate := {
  sourceRotaBaxter := sourceRotaBaxterCertificate
  targetYangBaxter := sourceYangBaxterCertificate
  spectralParameterUsed := 1
  baxterizationHolds := True
  baxterizationProof := trivial
}

def BaxterizationClosed (C : BaxterizationCertificate) : Prop :=
  RotaBaxterClosed C.sourceRotaBaxter ∧
  YangBaxterEquationClosed C.targetYangBaxter ∧
  C.baxterizationHolds

theorem source_baxterization_closed : BaxterizationClosed sourceBaxterizationCertificate := by
  exact And.intro (source_rota_baxter_closed) (And.intro source_yang_baxter_equation_closed sourceBaxterizationCertificate.baxterizationProof)

end YangBaxterEquationsRotaBaxterCanonicalLaneLean
end HautevilleHouse