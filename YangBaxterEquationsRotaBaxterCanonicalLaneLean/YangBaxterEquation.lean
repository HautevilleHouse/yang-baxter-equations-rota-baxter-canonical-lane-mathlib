import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.YangBaxterEquationsRotaBaxterCanonicalLaneLean.RotaBaxterAlgebra

namespace HautevilleHouse
namespace YangBaxterEquationsRotaBaxterCanonicalLaneLean

structure YangBaxterOperator (V : Type) where
  R : V → V → V → V → V
  yang_baxter_eq : ∀ a b c : V, R (R a b) c (R a c) = R a (R b c)

def YangBaxterEquationClosed (V : Type) (Y : YangBaxterOperator V) : Prop :=
  ∀ a b c : V, Y.yang_baxter_eq a b c

theorem yang_baxter_equation_holds (V : Type) (Y : YangBaxterOperator V) : YangBaxterEquationClosed V Y :=
  fun a b c => Y.yang_baxter_eq a b c

end YangBaxterEquationsRotaBaxterCanonicalLaneLean
end HautevilleHouse