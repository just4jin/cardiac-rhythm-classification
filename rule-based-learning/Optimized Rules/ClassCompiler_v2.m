Total_Patients = size(data,1);
Total_Classifed = size(Class1,1)+size(Class2,1)+size(Class3,1);


for n = 1:size(Class1,1)
   Class1(n,8) = 1; 
end

for n = 1:size(Class2,1)
   Class2(n,8) = 2; 
end

for n = 1:size(Class3,1)
   Class3(n,8) = 3; 
end