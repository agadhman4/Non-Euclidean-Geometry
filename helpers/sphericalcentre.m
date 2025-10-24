function centre= sphericalcentre(p1,p2)
% Calculates and returns the spherical centre of the spherical line through
% z1 and z2
centre =(p2*(abs(p1)^2-1)-p1*(abs(p2)^2-1))/(conj(p1)*p2-p1*conj(p2));

