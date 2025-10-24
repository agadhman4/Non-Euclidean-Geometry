function array = sphericaltriangletransformold(z1,z2,z3)
% Applies the transformation S1,S2 or S3 to the spherical triangle bound by z1,z2,z3
% depending on ordering of their respective angles

% if z1,z2,z3 have angles pi/2,pi/2,pi/p resp then it applies S1
% if z1,z2,z3 have angles pi/3,pi/p,pi/2 resp then it applies S2
% if z1,z2,z3 have angles pi/p,pi/2,pi/3 resp then it applies S3

% Outputs are the vertices of the transformed triangle 
tol=1e-9;
large_modulus=1e9;
if abs(z1) > large_modulus; z1 = Inf; end
if abs(z2) > large_modulus; z2 = Inf; end
if abs(z3) > large_modulus; z3 = Inf; end
% First find transformation R3

if abs(z1*conj(z2)-z2*conj(z1))<tol
    theta=angle(z1-z2);
    R3=@(z) exp(2i*theta)*conj(z);
    R3(inf)=inf;
else
    a=sphericalcentre(z1,z2);
    R3=@(z) (a*conj(z)+1)/(conj(z-a));
    R3(a)=inf;
    R3(inf)=a;
end

% Now find R2 similarly 

if abs(z1*conj(z3)-z3*conj(z1))<tol
    theta=angle(z1-z3);
    R2=@(z) exp(2i*theta)*conj(z);
    R2(inf)=inf;
else
    a=sphericalcentre(z1,z3);
    R2=@(z) (a*conj(z)+1)/(conj(z-a));
    R2(a)=inf;
    R2(inf)=a;
   
end

array =[z1,R2(R3(z2)),R2(R3(z3))];