%%Script for assigning weights
function [Decision] = NearestNeighborWeighting(Value, Nearest_Neighbors,attribute)
Class1_Probability = 0;
Class2_Probability = 0;
Class3_Probability = 0;



for n = 1:size(Nearest_Neighbors,1)
    Difference = abs(Value - Nearest_Neighbors(n,attribute))/Value;
    Score = 1000-Difference;
    NN_Class = Nearest_Neighbors(n,8);
    if NN_Class == 1
        Class1_Probability = Class1_Probability + Score;
    else
        if NN_Class == 2
            Class2_Probability = Class2_Probability + Score;
        else
            Class3_Probability = Class2_Probability + Score;
        end
    end
    
end

Score_Distribution = [Class1_Probability Class2_Probability Class3_Probability];
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

Decision = k;