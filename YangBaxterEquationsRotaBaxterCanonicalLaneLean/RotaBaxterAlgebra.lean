import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace YangBaxterEquationsRotaBaxterCanonicalLaneLean

structure RotaBaxterAlgebra where
  carrier : Type
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  R : carrier → carrier
  add_assoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  zero_add : ∀ a : carrier, add zero a = a
  add_zero : ∀ a : carrier, add a zero = a
  add_comm : ∀ a b : carrier, add a b = add b a
  mul_assoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  one_mul : ∀ a : carrier, mul one a = a
  mul_one : ∀ a : carrier, mul a one = a
  left_distrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  right_distrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  rota_baxter_eq : ∀ a b : carrier, mul (R a) (R b) = add (R (mul (R a) b)) (add (R (mul a (R b))) (mul a b))

def RotaBaxterAlgebraClosed (A : RotaBaxterAlgebra) : Prop :=
  ∀ a b : A.carrier, A.rota_baxter_eq a b

theorem primitive_rota_baxter_eq_holds (A : RotaBaxterAlgebra) : RotaBaxterAlgebraClosed A :=
  fun a b => A.rota_baxter_eq a b

end YangBaxterEquationsRotaBaxterCanonicalLaneLean
end HautevilleHouse