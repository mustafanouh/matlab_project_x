clc
clear
p=[1:10];
t=[p.^2];
net=newff(p,t,[3],{'logsig' 'purelin'});
net.divideparam.trainRatio=1;
net.divideparam.testRatio=0;
net.divideparam.valRatio=0;
net.trainparam.lr=0.1;
net.trainparam.min_grad=1e-20;
net.trainparam.goal=1e-30;
net.trainparam.epochs=300;
net=train(net,p,t);
plot([1:100].^2,'x')
hold on
plot(round(net(1:100)),'o')
hold on
plot(p,t,'*g')
legend('real target','output of net','training samples','Location','northwest')