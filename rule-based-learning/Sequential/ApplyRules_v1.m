function [ Results ] = ApplyRules_v1( Rules,data )

Results = zeros(size(data,1),3);
for n = 1:(size(Rules,1))
    attribute = Rules(n,1);
    minimum = Rules(n,2);
    maximum = Rules(n,3);
    coverage = Rules(n,4);
    class = Rules(n,5);
    for m = 1:size(data)
        if data(m,attribute) >= minimum
            if data(m,attribute) <= maximum
                Results(m,class) = coverage;
            end
        end
    end
end
end

