function array = S3(z1,z2,z3)
w1=reflection(z2,z3,z1);
temp2=reflection(z1,z3,z2);
w2=reflection(z2,z3,temp2);
w3=z3;
array=[w1,w2,w3];