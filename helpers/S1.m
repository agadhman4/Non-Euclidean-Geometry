function array = S1(z1,z2,z3)
temp3=reflection(z1,z2,z3);
array=[z1,reflection(z1,z3,z2),reflection(z1,z3,temp3)];
