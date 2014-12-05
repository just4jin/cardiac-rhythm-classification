function [ Accuracy, Correct, Wrong ] = Checker_v2( Matrix, Class_Number )
%Matrix contains the data to be checked, while Class_Number represents which class
%is being check
Correct = 0; Wrong = 0;
for n = 1:size(Matrix,1)
    if Matrix(n,8) == Class_Number
        Correct = Correct + 1;
    else
        Wrong = Wrong + 1;
    end
end

Accuracy = Correct/(Correct+Wrong);