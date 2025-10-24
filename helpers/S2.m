function array = S2(z1,z2,z3)
temp1=reflection(z2,z3,z1);
w1=reflection(z1,z2,temp1);
w2=z2;
w3=reflection(z1,z2,z3);
array=[w1,w2,w3];