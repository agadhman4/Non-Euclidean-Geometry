function key = canonical_key(M)
    % Returns a unique string key for a 2x2 matrix M modulo 3,
    % choosing a canonical representative for PSL(2,3).
    % We compare M and -M (mod 3) and choose the lexicographically smaller one.
    M_mod = mod(M, 3);
    M_neg = mod(-M, 3);
    vec1 = M_mod(:);
    vec2 = M_neg(:);
    if lex_less(vec1, vec2)
        canonical = M_mod;
    else
        canonical = M_neg;
    end
    % Create key as a comma-separated list of the four entries.
    key = sprintf('%d,%d,%d,%d', canonical(1), canonical(2), canonical(3), canonical(4));
end
