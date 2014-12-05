function [Results_attribute] = IBL_general_v1(data,attribute,N)

%Columns 1-PID 2-HR 3-HRV 4-AGE 5-LDS 6-COSEn 7-DFA 8-Class

%Initialize results
Results_attribute = data;
%Find nearest N neighbors for 1 attribute

data_attribute = sortrows(data,attribute);
%N needs to be even.s
for test = 1:1;
for Patient = 1:size(data,1)
Difference_old = inf;
Diference_new = 0;
for n = 1:size(data,1)
Value = data(Patient,attribute);

Difference_new = Value - data_attribute(n,attribute);
Log_difference(n,1) = Difference_new;

if abs(Difference_new) > abs(Difference_old)
    break
end
Difference_old = Difference_new;
end
%General Case
Location = n-1;
lower = n-1-(N/2);
upper = n-1+(N/2);
if lower < 1
    lower = 1; 
end
    if upper > size(data,1)
        upper = size(data,1);
    end
Nearest_Neighbors = data_attribute(lower:upper,:);
Decision = NearestNeighborWeighting(Value, Nearest_Neighbors,attribute);
Results_attribute(Patient,8) = Decision;

end

end
end