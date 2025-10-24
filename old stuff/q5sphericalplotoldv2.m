% Script to compute all triples of admissible vertices in the case that p=3
% We compute the triples and their corresponding PSL(2,3) matrices and
% store them then plot the triangles 
% Generators of PSL(2,3)
sigma1 = [0 1; -1 0];
sigma2 = [0 -1; 1 -1];
sigma3 = [1 1; 0 1];
generators = {sigma1, sigma2, sigma3};

% Triangle transformations
S1 = @(triple) S1(triple(1),triple(2),triple(3));
S2 = @(triple) S2(triple(1),triple(2),triple(3));
S3 = @(triple) S3(triple(1),triple(2),triple(3));
transform_func = {S1, S2, S3};

tol = 1e-9;
target_count = 12;

% Initial triple and matrix
r = sqrt((sqrt(3)*tan(pi/3)-1)/(sqrt(3)*tan(pi/3)+1)); 
w = sqrt((2*sin(pi/3)-1)/(2*sin(pi/3)+1)) * exp(1i*pi/3);
initial_triple = [w, r, 0];
triples = [initial_triple];
matrices = {canonical_psl_matrix(eye(2),3)};

% Generates and compares new triples (with corresponding matrices)
while length(triples) < target_count
    n = length(triples);
    new_found = false;

    for l = 1:n
        curr_triple = triples(l, :);
        curr_matrix = matrices{l};

        for j = 1:3
            next_triple = transform_func{j}(curr_triple);
            if ~tripleExists(next_triple, triples, tol)
                next_matrix = mod(generators{j} * curr_matrix, 3);
                canon_next = canonical_psl_matrix(next_matrix,3);
                triples(end+1, :) = next_triple;
                matrices{end+1} = canon_next;
                new_found = true;

                if length(triples) >= target_count
                    break;
                end
            end
        end
        if length(triples) >= target_count
            break;
        end
    end

    if ~new_found
        break;
    end
end

% Plot the triangles
figure; hold on;
for k = 1:length(triples)
    x = triples(k, :);
    drawsphericaltriangleq5(x(1), x(2), x(3));
end
