% load('y1prune.m')
% load('y2prune.m')
% load('y3prune.m')

figure()
hold on

% Coverage1 = Rules1(:,4)/size(Class1,1)*100;
% Coverage2 = Rules2(:,4)/size(Class2,1)*100;
% Coverage3 = Rules3(:,4)/size(Class3,1)*100;

plot(y1, 'r')
plot(y2, 'b')
plot(y3, 'g')
ylabel('Accuracy')
xlabel('Rules Removed')
legend('Rule Set1', 'Rule set2', 'Rule set3')
% axis([0  -inf inf]);
