function z = stereo(P)
% Stereographically projects a matrix of N points on the sphere 
    x = P(:,1);
    y = P(:,2);
    z_coord = P(:,3);

  
    denom = 1 - z_coord;
    z = x ./ denom + 1i*(y ./ denom);
end
