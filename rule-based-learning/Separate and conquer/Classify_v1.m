%Read Data
data = csvread('Testing2.csv');
%Columns 1-PID 2-HR 3-HRV 4-AGE 5-LDS 6-COSEn 7-DFA 8-Class
%Sort Data Into Three Class
Results = data;

for z = 1:1
    zz = z-1;
Results(:,8) = 0;
for n = 1:(size(Rules,1)-zz)
    attribute = Rules(n,1);
    minimum = Rules(n,2);
    maximum = Rules(n,3);
    class = Rules(n,5);
    
    for m = 1:size(data)
        if Results(m,8) == 0
        if data(m,attribute) >= minimum
            if data(m,attribute) <= maximum
                Results(m,8) = class;
            end
        end
        end
    end
end

for m = 1:size(Results)
if Results(m,8) == 0
    Results(m,8) =2;
end
end

[ Accuracy, Correct, Wrong ] = Checker_v2(Results, data);
y(z) = Accuracy;
end

plot(y)
ylabel('Accuracy')
xlabel('Rules Removed')