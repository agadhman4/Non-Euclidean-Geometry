function array = S2hyp(z1,z2,z3)
temp1=hyperbolic_reflection(z2,z3,z1);
w1=hyperbolic_reflection(z1,z2,temp1);
w2=z2;
w3=hyperbolic_reflection(z1,z2,z3);
array=[w1,w2,w3];