function array = S3hyp(z1,z2,z3)
w1=hyperbolic_reflection(z2,z3,z1);
temp2=hyperbolic_reflection(z1,z3,z2);
w2=hyperbolic_reflection(z2,z3,temp2);
w3=z3;
array=[w1,w2,w3];