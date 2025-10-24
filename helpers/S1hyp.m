function array = S1hyp(z1,z2,z3)
temp3=hyperbolic_reflection(z1,z2,z3);
array=[z1,hyperbolic_reflection(z1,z3,z2),hyperbolic_reflection(z1,z3,temp3)];
