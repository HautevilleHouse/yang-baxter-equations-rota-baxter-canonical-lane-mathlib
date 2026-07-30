import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace YangBaxterEquationsRotaBaxterCanonicalLaneLean

structure MatrixYangBaxterData where
  n : Nat
  R : Matrix (Fin n) (Fin n) (Matrix (Fin n) (Fin n) ℚ)
  matrixYangBaxter : R * (R ⊗ I) * R = (I ⊗ R) * R * (I ⊗ R)
    where
    I : Matrix (Fin n) (Fin n) ℚ := 1

def sourceMatrixYangBaxterData : MatrixYangBaxterData := {
  n := 1
  R := λ i j => 1
  matrixYangBaxter := by
    simp
}

def MatrixYangBaxterClosed (M : MatrixYangBaxterData) : Prop :=
  M.matrixYangBaxter

theorem source_matrix_yang_baxter_closed : MatrixYangBaxterClosed sourceMatrixYangBaxterData := by
  rfl

end HautevilleHouse
end YangBaxterEquationsRotaBaxterCanonicalLaneLean