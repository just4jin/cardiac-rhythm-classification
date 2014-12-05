%Read Data
data_test = csvread('Testing2.csv');
%Columns 1-PID 2-HR 3-HRV 4-AGE 5-LDS 6-COSEn 7-DFA 8-Class
%Sort Data Into Three Class
Decisions = data_test;

[Rules1] = RuleGenerator_v3(1);
[Rules2] = RuleGenerator_v3(2);
[Rules3] = RuleGenerator_v3(3);
    [ Results1 ] = ApplyRules_v1( Rules1,data_test);
    [ Results2 ] = ApplyRules_v1( Rules2,data_test );
    [ Results3 ] = ApplyRules_v1( Rules3,data_test );

for z = 1:size(Rules2)
    zz = size(Rules2,1)+1-z;
%     [ Results1 ] = ApplyRules_v1( Rules1,data);
    
%     [ Results1 ] = ApplyRules_v1( Rules1(1:zz,:),data_test);
    [ Results2 ] = ApplyRules_v1( Rules2(1:zz,:),data_test);
    
%     [ Results2 ] = ApplyRules_v1( Rules2,data );
    % [ Results3 ] = ApplyRules_v1( Rules3,data );
%     [ Results3 ] = ApplyRules_v1( Rules3(1:zz,:),data_test);
%     
    Results_Final = Results1 + Results2+ Results3;
    
    for n = 1:size(Results_Final)
        Score_Distribution = Results_Final(n,:);
        [j, k] = find(Score_Distribution==max(Score_Distribution(:)));
        if size(k,2) == 2
            if k(1) == 1
                k = k(2);
                if k(1) == 2
                    k = k(1);
                end
            end
        end
        if size(k,2) == 3
            k = 2;
        end
        Decisions(n,8) = k;
        
        
    end
    
    [ Accuracy, Correct, Wrong ] = Checker_v2( Decisions, data_test );
    y(z) = Accuracy;
end
% figure()
% hold on
%
% Coverage1 = Rules1(:,4)/size(Class1,1)*100;
% Coverage2 = Rules2(:,4)/size(Class2,1)*100;
% Coverage3 = Rules3(:,4)/size(Class3,1)*100;
%
% plot(Coverage1, 'r')
% plot(Coverage2, 'b')
% plot(Coverage3, 'g')
% ylabel('% Coverage')
% xlabel('Rule')
% legend('Rule Set1', 'Rule set2', 'Rule set3')
% axis([0 60 -inf inf]);
