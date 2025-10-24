function transformed_z = hyperbolic_reflection(p1,p2,z)
tol=1e-9;
if abs(p1*conj(p2)-p2*conj(p1))< tol 
    theta=angle(p1-p2);
    transformed_z=exp(2i*theta)*conj(z);
else
    a=(p2*(abs(p1)^2+1)-p1*(abs(p2)^2+1))/(conj(p1)*p2-p1*conj(p2));
     transformed_z=(a*conj(z)-1)/(conj(z-a));
end