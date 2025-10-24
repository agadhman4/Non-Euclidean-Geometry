 function flag = lex_less(v1, v2)
 % Returns true if vector v1 is lexicographically less than v2
    flag = false;
    for idx = 1:length(v1)
        if v1(idx) < v2(idx)
            flag = true;
            return;
        elseif v1(idx) > v2(idx)
            flag = false;
            return;
        end
    end
end
