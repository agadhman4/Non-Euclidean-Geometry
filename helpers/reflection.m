function transformed_z = reflection(p1,p2,z)
% Reflects z in the spherical line through p1, p2
tol=1e-9;
large_mod=1e9;
% Handle inf
 if abs(p1)>large_mod 
     p1=inf;
 end
 if abs(p2)>large_mod
     p2=inf;
 end
 if abs(z)> large_mod
     z=inf;
 end

 % Apply euclidean reflection or inversion depending on which case
 if ~isinf(z)

 if abs(p1*conj(p2)-p2*conj(p1))< tol 
    theta=angle(p1-p2);
    transformed_z=exp(2i*theta)*conj(z);
 elseif p1 == inf
    theta=angle(p2);
    transformed_z=exp(2i*theta)*conj(z);
 elseif p2 == inf
     theta=angle(p1);
     transformed_z=exp(2i*theta)*conj(z);
 else
     a=sphericalcentre(p1,p2);
     if abs(z-a)<tol
         transformed_z=inf;
     else
        transformed_z=(a*conj(z)+1)/(conj(z-a));
     end
 end

 else
     if abs(p1*conj(p2)-p2*conj(p1))< tol 
         transformed_z=inf;
     else 
         a=sphericalcentre(p1,p2);
         transformed_z=a;
     end
 end