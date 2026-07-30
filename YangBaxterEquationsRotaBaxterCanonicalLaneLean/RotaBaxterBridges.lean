import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.YangBaxterEquationsRotaBaxterCanonicalLaneLean.RotaBaxterAlgebra
import HautevilleHouse.YangBaxterEquationsRotaBaxterCanonicalLaneLean.YangBaxterEquation

namespace HautevilleHouse
namespace YangBaxterEquationsRotaBaxterCanonicalLaneLean

structure BridgeData where
  algebra : RotaBaxterAlgebra
  operator : YangBaxterOperator (algebra.carrier)
  bridgeProperty : ∀ a b c : algebra.carrier, algebra.rota_baxter_eq a b → operator.yang_baxter_eq a b c

def bridgeClosed (B : BridgeData) : Prop :=
  ∀ a b c : B.algebra.carrier, B.algebra.rota_baxter_eq a b → B.operator.yang_baxter_eq a b c

theorem bridge_from_data (B : BridgeData) : bridgeClosed B :=
  B.bridgeProperty

end YangBaxterEquationsRotaBaxterCanonicalLaneLean
end HautevilleHouse