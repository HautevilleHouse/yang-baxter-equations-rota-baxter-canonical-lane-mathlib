import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace YangBaxterEquationsRotaBaxterCanonicalLaneLean

structure QuantumYangBaxterData where
  H : Type
  [Add H]
  [Mul H]
  R : H → H → H → H
  quantumHexagon : ∀ a b c : H, R (R a b) c = R a (R b c)
  pentagonCondition : ∀ a b c d : H, R (R a b) c d = R a (R b c) d

def sourceQuantumYangBaxterData : QuantumYangBaxterData := {
  H := Unit
  R := λ a b c => ()
  quantumHexagon := by intro a b c; rfl
  pentagonCondition := by intro a b c d; rfl
}

def QuantumYangBaxterClosed (Q : QuantumYangBaxterData) : Prop :=
  Q.quantumHexagon ∧ Q.pentagonCondition

theorem source_quantum_yang_baxter_closed : QuantumYangBaxterClosed sourceQuantumYangBaxterData := by
  exact And.intro rfl rfl

end HautevilleHouse
end YangBaxterEquationsRotaBaxterCanonicalLaneLean