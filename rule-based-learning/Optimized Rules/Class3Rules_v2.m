%% LDS Ruleset
%If LDS < 0.3156 then C3 also if LDS > 2.6704 then C1

n3=1;
for n = 1:size(data,1)
    if data(n,8) == 0
    else
        if data(n,5) < 0.3156
            Class3(n3,:) = data(n,:);
            n3 = n3+1;
            data(n,:) = zeros(size(data(n,:)));
            
        end
    end
end

%% DFA Ruleset
%If DFA < 0.188881 then C3 also if DFA > 1.349 then C2
for n = 1:size(data,1)
    if data(n,8) == 0
    else
        if data(n,7) < 0.391
            Class3(n3,:) = data(n,:);
            n3 = n3+1;
            data(n,:) = zeros(size(data(n,:)));
        end
    end
end

%% HRV Ruleset
%if HRV < 23.4079 then C2 also if HRV >293.1128 then C3

for n = 1:size(data,1)
    if data(n,8) == 0
    else
        if data(n,3) > 121.5
            Class3(n3,:)=data(n,:);
            n3 = n3+1;
            data(n,:) = zeros(size(data(n,:)));
        end
    end
end

