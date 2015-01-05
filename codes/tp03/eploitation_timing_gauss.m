%% script pour traiter les résultats de la simulation de gauss

data=load('timineGauss.txt')
n=size(data,1)

id=plot(data(:,1),data(:,2),'b*-','lineWidth',2);
title('evolution time gauss','fontSize',18);
xlabel('n');ylabel('t_n')
saveas(id,'timingGauss1.png');

data2=log(data);

id=plot(data2(:,1),data2(:,2),'r*');
xlabel('log(n)');ylabel('log(t_n)');
title('loglog representation','fontSize',18);
saveas(id,'timingGauss2.png');


%% linear regression

p=polyfit(data2(:,1),data2(:,2),1);

hold on
id=plot(data2(:,1),data2(:,2),'r*');
plot(data2(:,1),polyval(p,data2(:,1)),'b--','lineWidth',2);
t=sprintf('regression lineaire p=%.2f',p(1));

title(t,'fontSize',18);
saveas(id,'regression.png');

