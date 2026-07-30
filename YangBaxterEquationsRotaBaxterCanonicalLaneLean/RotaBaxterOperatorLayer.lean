import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace YangBaxterEquationsRotaBaxterCanonicalLaneLean

structure RotaBaxterOperator (A : Type) [Add A] [Mul A] where
  P : A → A
  idempotent : ∀ x, P (P x) = P x
  rotaBaxter : ∀ x y, P x * P y = P (P x * y + x * P y - x * y)

def primitiveRotaBaxterOperator (A : Type) [Add A] [Mul A] : RotaBaxterOperator A :=
  {
    P := fun x => x,
    idempotent := fun x => rfl,
    rotaBaxter := fun x y => by
      simp
  }

def RotaBaxterClosed (A : Type) [Add A] [Mul A] (P : RotaBaxterOperator A) : Prop :=
  P.rotaBaxter

theorem primitive_rota_baxter_closed_checked (A : Type) [Add A] [Mul A] :
    RotaBaxterClosed A (primitiveRotaBaxterOperator A) := by
  intro x y
  rfl

end YangBaxterEquationsRotaBaxterCanonicalLaneLean
end HautevilleHouse