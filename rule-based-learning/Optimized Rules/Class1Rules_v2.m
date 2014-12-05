clear
%Read Data
data = csvread('TrainingData.csv');
%Columns 1-PID 2-HR 3-HRV 4-AGE 5-LDS 6-COSEn 7-DFA 8-Class
%Sort Data Into Three Class
n1=1; n2=1; n3=1;
% for n = 1:size(data,1)
%     if data(n,8) == 1
%         Class1(n1,:) = data(n,:);
%         n1 = n1+1;
%     else
%         if data(n,8) == 2
%             Class2(n2,:)=data(n,:);
%             n2 = n2+1;
%         else
%             Class3(n3,:)=data(n,:);
%             n3 = n3+1;
%         end
%     end
% end
% Total_Class1 = size(Class1,1);
% Total_Class2 = size(Class2,1);
% Total_Class3 = size(Class3,1);


%% COSEn Thresholding
n1=1;
for n = 1:size(data,1)
    if data(n,8) == 0
    else
    if data(n,6) > -0.8756
        Class1(n1,:)=data(n,:);
        n1 = n1+1;
        data(n,:) = zeros(size(data(n,:)));
    end
    end
end

%% LDS Ruleset
for n = 1:size(data,1)
    if data(n,8) == 0
    else
        if data(n,5) > 2.6704
            Class1(n1,:)=data(n,:);
            n1 = n1+1;
            data(n,:) = zeros(size(data(n,:)));
            
        end
    end
end


%%Begin Secondary Rules
