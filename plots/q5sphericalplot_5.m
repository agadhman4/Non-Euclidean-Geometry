% Script to compute all triples of admissible vertices in the case that p=5
% We compute the corresponding PSL(2,5) elements as products of generators
% then use this to generate the new triple of vertices
sigma1=[0 1; -1 0];
sigma2= [0 -1; 1 -1];
sigma3= [1 1; 0 1];
generators={sigma1,sigma2,sigma3};
tol=1e-9;

r=sqrt((sqrt(3)*tan(pi/5)-1)/(sqrt(3)*tan(pi/5)+1)); 
w=sqrt((2*sin(pi/5)-1)/(2*sin(pi/5)+1))*exp(1i*pi/5);

initial_triple=[w,r,0];
S1=@(triple) S1(triple(1),triple(2),triple(3));
S2=@(triple) S2(triple(1),triple(2),triple(3));
S3=@(triple) S3(triple(1),triple(2),triple(3));
transform_func={S1,S2,S3};

% Since PSL(2,5) has 60 elements (Note we can also run this without a
% target count but will take longer)
target_count=60;


matrices = {canonical_psl_matrix(eye(2),5)};
triples  = [initial_triple];

% Start generating matrices and triples
while length(matrices) < target_count
    n = length(matrices);
    new_found = false;

    for l = 1:n
        curr_matrix = matrices{l};
        curr_triple = triples(l,:);  

        for k = 1:3
            next_matrix = mod(curr_matrix*generators{k}, 5);
            canon_next  = canonical_psl_matrix(next_matrix,5);
            already_found = any(cellfun(@(A) isequal(A, canon_next), matrices));
            next_triple = transform_func{k}(curr_triple);

            if ~already_found 
                matrices{end+1} = canon_next;
                triples(end+1, :) = next_triple;  
                new_found = true;

                if length(matrices) >= target_count
                    break;
                end
            end
        end
        if length(matrices) >= target_count
            break;
        end
    end

    if ~new_found
        break;
    end
end
% Plots triangles 
figure;
hold on

for k=1:target_count
    x=triples(k,:);
    drawsphericaltriangleq5(x(1),x(2),x(3))
end
