clear
%Read Data
data = csvread('TrainingData.csv');
%Columns 1-PID 2-HR 3-HRV 4-AGE 5-LDS 6-COSEn 7-DFA 8-Class
%Sort Data Into Three Class
n1=1; n2=1; n3=1;
for n = 1:size(data,1)
    if data(n,8) == 1
        Class1(n1,:) = data(n,:);
        n1 = n1+1;
    else
        if data(n,8) == 2
            Class2(n2,:)=data(n,:);
            n2 = n2+1;
        else
            Class3(n3,:)=data(n,:);
            n3 = n3+1;
        end
    end
end
Total_Class1 = size(Class1,1);
Total_Class2 = size(Class2,1);
Total_Class3 = size(Class3,1);

%Initialize results
Results_COSEn = data;
%Find nearest N neighbors for 1 attribute

data_COSEn = sortrows(data,2);
%N needs to be even.

for test = 1:10;
    N = test*2;
for Patient = 1:size(data,1)
Difference_old = inf;
Diference_new = 0;
for n = 1:size(data,1)
Value = data(Patient,6);

Difference_new = Value - data_COSEn(n,6);
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
Nearest_Neighbors = data_COSEn(lower:upper,:);
Decision = NearestNeighborWeighting(Value, Nearest_Neighbors);
Results_HR(Patient,8) = Decision;
end
[ Accuracy, Correct, Wrong ] = Checker_ILB( Results_HR, data )
Log_N(test,:) = [N, Accuracy, Correct, Wrong];
end