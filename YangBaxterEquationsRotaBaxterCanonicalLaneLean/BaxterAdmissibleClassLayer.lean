import canonicalLaneMathlib.AdmissibleClass
import YangBaxterEquationsRotaBaxterCanonicalLaneLean.YangBaxterEquationLayer
import YangBaxterEquationsRotaBaxterCanonicalLaneLean.RotaBaxterOperatorLayer

namespace HautevilleHouse
namespace YangBaxterEquationsRotaBaxterCanonicalLaneLean

structure BaxterAdmissibleClass (A : Type) [Add A] [Mul A] where
  solution : YangBaxterSolution
  operator : RotaBaxterOperator A
  compatibility : YangBaxterEquationClosed solution ∧ RotaBaxterClosed A operator

def primitiveBaxterAdmissibleClass (A : Type) [Add A] [Mul A] : BaxterAdmissibleClass A :=
  {
    solution := primitiveYangBaxterSolution,
    operator := primitiveRotaBaxterOperator A,
    compatibility := And.intro primitive_yang_baxter_equation_closed_checked (primitive_rota_baxter_closed_checked A)
  }

def BaxterClosure (A : Type) [Add A] [Mul A] (B : BaxterAdmissibleClass A) : Prop :=
  B.compatibility

theorem primitive_baxter_closure_checked (A : Type) [Add A] [Mul A] :
    BaxterClosure A (primitiveBaxterAdmissibleClass A) := by
  exact primitiveBaxterAdmissibleClass A |>.compatibility

end YangBaxterEquationsRotaBaxterCanonicalLaneLean
end HautevilleHouse