import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace YangBaxterEquationsRotaBaxterCanonicalLaneLean

structure RotaBaxterWittData where
  L : Type
  [Add L]
  [Mul L]
  d : L → L
  wittCondition : ∀ x y : L, d (x * y) = d x * y + x * d y + d x * d y

def sourceRotaBaxterWittData : RotaBaxterWittData := {
  L := Unit
  d := λ x => ()
  wittCondition := by intro x y; rfl
}

def RotaBaxterWittClosed (W : RotaBaxterWittData) : Prop :=
  W.wittCondition

theorem source_rota_baxter_witt_closed : RotaBaxterWittClosed sourceRotaBaxterWittData := by
  rfl

end HautevilleHouse
end YangBaxterEquationsRotaBaxterCanonicalLaneLean