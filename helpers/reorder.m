function reordered_triple = reorder(z1, z2, z3)
% Reorders a triple with Inf to the first position.
% Takes three complex numbers (or Inf) as separate inputs.

    triple = [z1, z2, z3]; % Create a row vector

    if isinf(triple(1)) || abs(triple(1))>1e7
        reordered_triple = [inf,triple(2),triple(3)];
    elseif isinf(triple(2)) || abs(triple(2))>1e7
        reordered_triple = [inf, triple(1), triple(3)];
    elseif isinf(triple(3)) || abs(triple(3))>1e7
        reordered_triple = [inf, triple(1), triple(2)];
    else
        reordered_triple = triple;
    end
end