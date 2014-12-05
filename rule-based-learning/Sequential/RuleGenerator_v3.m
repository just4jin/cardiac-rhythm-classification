function [Rules] = RuleGenerator_v3(class)
%Read Data
data = csvread('TrainingData2.csv');
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
Total = [size(Class1,1) size(Class2,1) size(Class3,1)];
Size = sum(Total);
%%
n1=1; n2=1; n3=1;

count = 1;
m = 1;
x =1;
counter = 1;
while(size(data,1) > 10)
    m = 1;
    Log = [];
    for attribute = 2:7
        data = [sortrows(data,attribute); zeros(1,8)];
        for n = 1:size(data,1)-1
            if data(n,8) == class
            if data(n,8) == data(n+1,8);
                %Count the consecutive times class is shown
                count =  count + 1;   
            else
                Log(m,:) = [n count attribute data(n,8)];
                count = 1;
                m = m+1;
            end
            
            end
        end
        data(n+1,:) = [];
    end
    
    %Find rule with the most coverage
    if size(Log,1) == 0
        break
    end
    Log(:,2) = -Log(:,2);
    Log = sortrows(Log,2);
    attri = Log(1,3);
    data = sortrows(data,attri);
    Log(:,2) = -Log(:,2);
    min_n = Log(1,1) - Log(1,2) +1;
    max_n = Log(1,1);
    data = sortrows(data,attri);
    
    %Store Rule: [attribute min_val max_val coverage class]
    Rules(x,:) = [attri, data(min_n,attri)-0.00001, data(max_n,attri)+0.00001, Log(1,2), Log(1,4)];
    x = x +1;
    
    counter = counter +1
    
    %Remove Data
    data(min_n:max_n,:) = [];
end
% 
figure()
plot(Rules(:,4));
ylabel('Instances Covered')
xlabel('Rule')
end