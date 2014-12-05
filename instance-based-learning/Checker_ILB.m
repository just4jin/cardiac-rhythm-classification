function [ AC1, AC2, AC3 ] = Checker_ILB( Decision, Data )
%Matrix contains the data to be checked, while Class_Number represents which class
%is being check
n1 = 1; n2 = 1; n3 = 1;
for n = 1:size(Data,1)
    if Decision(n,8) == 1
        C1(n1,:) = Data(n,:);
        n1 = n1+1;
    else
        if Decision(n,8) == 2
            C2(n2,:)=Data(n,:);
            n2 = n2+1;
        else
            C3(n3,:)=Data(n,:);
            n3 = n3+1;
        end
    end
end

Correct = 0; Wrong = 0;
for n = 1:size(C1,1)
    if C1(n,8) == 1      
        Correct = Correct + 1;
    else
        Wrong = Wrong + 1;
    end
end

C1_Accuracy = Correct/(Correct+Wrong);
C1_Coverage = size(C1,1);
AC1 = [C1_Accuracy C1_Coverage];

Correct = 0; Wrong = 0;
for n = 1:size(C2,1)
    if C2(n,8) == 2      
        Correct = Correct + 1;
    else
        Wrong = Wrong + 1;
    end
end

C2_Accuracy = Correct/(Correct+Wrong);
C2_Coverage = size(C2,1);
AC2 = [C2_Accuracy C2_Coverage];

Correct = 0; Wrong = 0;
for n = 1:size(C3,1)
    if C3(n,8) == 3      
        Correct = Correct + 1;
    else
        Wrong = Wrong + 1;
    end
end

C3_Accuracy = Correct/(Correct+Wrong);
C3_Coverage = size(C3,1);
AC3 = [C3_Accuracy C3_Coverage];


end