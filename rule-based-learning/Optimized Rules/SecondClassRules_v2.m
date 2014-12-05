clear
% run('Class1Rules.m')
% run('Class2Rules.m')
% run('Class3Rules.m')
run('Class1Rules_v2.m')
run('Class2Rules_v2.m')
run('Class3Rules_v2.m')

%Read Data
%Columns 1-PID 2-HR 3-HRV 4-AGE 5-LDS 6-COSEn 7-DFA 8-Class
%Sort Data Into Three Class
%%
%% COSEn/LDS Rule set variation

for n = 1:size(data,1)
    if data(n,8) == 0
    else
        if data(n,6)/data(n,5) < -2.23
            Class2(n2,:) = data(n,:);
            n2 = n2+1;
            data(n,:) = zeros(size(data(n,:)));
            
            
        end
    end
end


%% HRV/AGE Rule set variation

for n = 1:size(data,1)
    if data(n,8) == 0
    else
        if data(n,3)/data(n,4) > 6.79
            if data(n,3)/data(n,4) < 18.4
                Class3(n3,:) = data(n,:);
                n3 = n3+1;
                data(n,:) = zeros(size(data(n,:)));
            else
                if data(n,8) == 0
                else
                    Class2(n2 ,:) = data(n,:);
                    n2 = n2+1;
                    data(n,:) = zeros(size(data(n,:)));
                    
                end
            end
        end
    end
end

%% HR*DFA Rule set variation - Potential Lower bound for Class 1

for n = 1:size(data,1)
    if data(n,8) == 0
    else
        rule = data(n,2)*data(n,7);
        if rule < 388.6
            if rule > 290
                Class3(n3,:) = data(n,:);
                n3 = n3+1;
                data(n,:) = zeros(size(data(n,:)));
            else
                Class2(n2 ,:) = data(n,:);
                n2 = n2+1;
                data(n,:) = zeros(size(data(n,:)));
                
            end
        end
    end
end

%% HR*COSEn/DFA Rule set variation - Potential Lower bound for Class 1

for n = 1:size(data,1)
    if data(n,8) == 0
    else
        rule = data(n,2)*data(n,6)/data(n,7);
        if rule > -1970
            Class1(n1,:) = data(n,:);
            n1 = n1+1;
            data(n,:) = zeros(size(data(n,:)));
        else
            if rule < -3355
                
                Class2(n2 ,:) = data(n,:);
                n2 = n2+1;
                data(n,:) = zeros(size(data(n,:)));
                
            end
        end
    end
end

%% DFA THRESHOLDING

for n = 1:size(data,1)
    if data(n,8) == 0
    else
        rule = data(n,7);
        if rule < 0.5006
            Class2(n2,:) = data(n,:);
            n2 = n2+1;
            data(n,:) = zeros(size(data(n,:)));
            
        end
    end
end

%% LDS Thresholding THRESHOLDING

for n = 1:size(data,1)
    if data(n,5) == 0
    else
        rule = data(n,5);
        if rule < 1.426
            if rule > 1.3
                Class1(n1,:) = data(n,:);
                n1 = n1+1;
                data(n,:) = zeros(size(data(n,:)));
                
            end
        end
    end
end
%% HR*DFA Thresholding THRESHOLDING

for n = 1:size(data,1)
    if data(n,5) == 0
    else
        rule = data(n,2)*data(n,7);
        if rule < 546.5
            
            Class3(n3,:) = data(n,:);
            n3 = n3+1;
            data(n,:) = zeros(size(data(n,:)));
            
        end
    end
end

%% COSEn Thresholding THRESHOLDING

for n = 1:size(data,1)
    if data(n,5) == 0
    else
        rule = data(n,6);
        if rule > -1.55
            
                Class1(n1,:) = data(n,:);
                n1 = n1+1;
                data(n,:) = zeros(size(data(n,:)));
            else
                Class2(n2,:) = data(n,:);
                n2 = n2+1;
                data(n,:) = zeros(size(data(n,:)));
          
        end
    end
end
