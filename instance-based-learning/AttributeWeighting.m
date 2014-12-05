clear
%Read Data
data_training = csvread('TrainingData.csv');
data_testing = csvread('Testing.csv');

%Columns 1-PID 2-HR 3-HRV 4-AGE 5-LDS 6-COSEn 7-DFA 8-Class
%Sort Data Into Three Class
n1=1; n2=1; n3=1;
for n = 1:size(data_training,1)
    if data_training(n,8) == 1
        Class1(n1,:) = data_training(n,:);
        n1 = n1+1;
    else
        if data_training(n,8) == 2
            Class2(n2,:)=data_training(n,:);
            n2 = n2+1;
        else
            Class3(n3,:)=data_training(n,:);
            n3 = n3+1;
        end
    end
end
Total_Class1 = size(Class1,1);
Total_Class2 = size(Class2,1);
Total_Class3 = size(Class3,1);
Total = size(data_training,1);

%Determine the final class assignment by using the results produced from each classification by attribute.
%Each attribute will submit a vote for what the final class should be. The weight of the vote will depend on the accuracy of the attribute
%However it may be better to weight each attribute based on ranges where their values are more accurate
%To determine those ranges. we look for where there are N correct classifications and T-N wrong classifications, resulting in a minimum accuracy of at least 95%
Final_Results = data_training;

Class_Probability = zeros(size(data_training,1),3);
for attribute = 2:7
Results_attribute = IBL_general_v1(data_training,attribute,2);
[ AC1, AC2, AC3 ] = Checker_ILB( Results_attribute, data_training);



for n = 1:size(Results_attribute)
class = Results_attribute(n,8);
if class == 1
    Class_Probability(n,1) = Class_Probability(n,1) + AC1(1)*AC1(2)/Total;
else
    if class == 2
        Class_Probability(n,2) = Class_Probability(n,2)+ AC2(1)*AC2(2)/Total;
    else
        Class_Probability(n,3) = Class_Probability(n,3) + AC3(1)*AC3(2)/Total;
    end
end

end
end

for n =1:size(Class_Probability,1)
    Score_Distribution = Class_Probability(n,:);
[j, k] = find(Score_Distribution==max(Score_Distribution(:)));
if size(k,2) > 2
    k = 2;
else
    if size(k,2) > 1
        if k(1,1) == 1
            k = k(1,2);
        else
            
            if k(1,1) == 2
                k = 2;
            end
        end
        
    end
end

Final_Results(n,8) = k;
end
