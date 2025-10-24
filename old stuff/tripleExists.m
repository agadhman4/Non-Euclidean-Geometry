function exists = tripleExists(newTriple, tripleMatrix, tol)
    % tripleExists returns true if newTriple is close (within tol) to any row
    % of tripleMatrix, comparing only finite entries.
    exists = false;

    for idx = 1:size(tripleMatrix, 1)
        existingTriple = tripleMatrix(idx, :);

        % Logical mask for finite values in both triples
        finite_mask = isfinite(newTriple) & isfinite(existingTriple);

        % Compare only those entries
        if all(abs(newTriple(finite_mask) - existingTriple(finite_mask)) < tol)
            exists = true;
            return;
        end
    end
end
