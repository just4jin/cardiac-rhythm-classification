%%Clas2 Rules
n2=1;

%%COSEn Thresholding
for n = 1:size(data,1)
    if data(n,8) == 0
    else
        if data(n,6) < -2.203
            Class2(n2,:) = data(n,:);
            n2 = n2+1;
            data(n,:) = zeros(size(data(n,:)));
        end
    end
end

%% DFA Ruleset
for n = 1:size(data,1)
    if data(n,8) == 0
    else
        if data(n,7) > 0.680
            Class2(n2,:)=data(n,:);
            n2 = n2+1;
            data(n,:) = zeros(size(data(n,:)));
        end
    end
end

%% HR Ruleset
for n = 1:size(data,1)
    if data(n,8) == 0
    else
        if data(n,2) < 387.7302
            Class2(n2,:) = data(n,:);
            n2 = n2+1;
            data(n,:) = zeros(size(data(n,:)));
            
        else
            if data(n,2) > 1407.6
                Class2(n2,:)=data(n,:);
                n2 = n2+1;
                data(n,:) = zeros(size(data(n,:)));
                
            end
        end
    end
end

%% HRV Ruleset

for n = 1:size(data,1)
    if data(n,8) == 0
    else
        if data(n,3) < 58 %%Accuracy only 85% currently
            Class2(n2,:) = data(n,:);
            n2 = n2+1;
            data(n,:) = zeros(size(data(n,:)));
        end
    end
end

