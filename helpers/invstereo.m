function P = invstereo(z)
% Computes the inverse stereographic projection

    
    if isvector(z)
        z = z(:); 
    end

    modz_sq = abs(z).^2;
    denom = modz_sq + 1;

    x = 2 * real(z) ./ denom;
    y = 2 * imag(z) ./ denom;
    z_coord = (modz_sq - 1) ./ denom;

    P = [x, y, z_coord];
end
