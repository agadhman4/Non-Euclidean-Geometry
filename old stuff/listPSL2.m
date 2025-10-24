function group = listPSL2(p, gens)
% listPSL2(p, gens) lists all elements of PSL(2, p) as words in the generators.
%   p    : a prime number.
%   gens : a cell array containing 3 generators (each a 2x2 matrix, with entries in Z_p)
%
% Output:
%   group: a struct array with fields:
%            .mat  - a 2x2 matrix (mod p) representing the element (a canonical rep in PSL(2,p))
%            .word - a string describing its factorization in terms of the generators.
%
% The search is done using a breadth-first algorithm beginning at ±I.
% For PSL(2, p) the identity in SL(2, p) and its negative represent the same element,
% so we choose a canonical representative via the helper function canonicalPSL().

    % Our starting element is the identity.
    I = mod(eye(2), p);
    % Create a structure for the identity element.
    elem.mat = I;
    elem.word = 'I';
    
    % We store group elements in a cell array (which we later convert to a struct array)
    groupCells = {elem};
    
    % Use a breadth-first search: index i traverses groupCells.
    i = 1;
    while i <= numel(groupCells)
        current = groupCells{i};
        % Multiply current element by each generator.
        for j = 1:numel(gens)
            % newMat = current.mat * generator j, computed mod p.
            newMat = mod(current.mat * gens{j}, p);
            % Choose the canonical representative for PSL(2,p) (i.e. we decide between newMat and -newMat)
            canonMat = canonicalPSL(newMat, p);
            newWord = [current.word, '*σ', num2str(j)]; %#ok<*AGROW>
            % Check if this element is new (by comparing canonical reps)
            if ~elementExists(canonMat, groupCells, p)
                newElem.mat = canonMat;
                newElem.word = newWord;
                groupCells{end+1} = newElem;
            end
        end
        i = i + 1;
    end
    
    % Convert cell array to struct array for easier use.
    group = [groupCells{:}];
end

function canon = canonicalPSL(M, p)
% canonicalPSL returns a canonical representative of the PSL(2,p) element
% represented by M (a 2x2 matrix). Since ±M represent the same element in PSL(2,p)
% we choose the one whose entries (read in column‐major order) are lexicographically smaller.
    M_mod = mod(M, p);
    M_neg = mod(-M, p);
    
    % Convert to vectors (column–major order)
    v1 = M_mod(:);
    v2 = M_neg(:);
    
    if lexicographicLess(v1, v2)
        canon = M_mod;
    else
        canon = M_neg;
    end
end

function flag = lexicographicLess(v1, v2)
% lexicographicLess returns true if vector v1 is lexicographically less than v2.
    flag = false;
    for k = 1:length(v1)
        if v1(k) < v2(k)
            flag = true;
            return;
        elseif v1(k) > v2(k)
            flag = false;
            return;
        end
    end
    % If they are equal, flag remains false.
end

function exists = elementExists(M, groupCells, p)
% elementExists checks if the matrix M (already in its canonical form) is 
% present among the matrices in groupCells.
    exists = false;
    for k = 1:numel(groupCells)
        A = groupCells{k}.mat;
        if isequal(mod(A, p), mod(M, p))
            exists = true;
            return;
        end
    end
end
