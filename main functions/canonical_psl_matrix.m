function M_can = canonical_psl_matrix(M,p)
% Returns the canonical representative of the matrix M in PSL(2,p)
% Out of M and -M (mod p), we choose the one with a lexicographically smaller vector
    M_mod = mod(M, p);
    M_neg = mod(-M, p);
    vec1 = M_mod(:);
    vec2 = M_neg(:);
    if lex_less(vec1, vec2)
        M_can = M_mod;
    else
        M_can = M_neg;
    end
end