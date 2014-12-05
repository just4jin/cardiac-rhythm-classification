function [ Accuracy, Correct, Wrong ] = Checker_v2( Classified, Original )
%Matrix contains the data to be checked, while Class_Number represents which class
%is being check
Correct = 0; Wrong = 0;
for n = 1:size(Classified,1)
    if Classified(n,8) == Original(n,8)
        Correct = Correct + 1;
    else
        Wrong = Wrong + 1;
    end
end

Accuracy = Correct/(Correct+Wrong);