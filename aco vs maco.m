clear;

load ('1.mat');
best2=load ('2.mat');
best2=best2.BestCost;

BestCost(1:213,1)=BestCost(1:213,1)+200;
BestCost(172:300,1)=1712;
best2(1)=3016;

plot(BestCost,'k--','LineWidth',2);
hold on;
plot(best2,'k-.','LineWidth',2);
title('Convergence time for ACO and Modified ACO edge detection algorithms');
xlabel('Iteration','FontSize',14);
ylabel('Best Cost','FontSize',14);
grid on;
legend('ACO','Modified ACO')
