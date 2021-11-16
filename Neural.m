function [s] = Neural(neuronsNum , interatNum )

load 'D:\FCI\Second term\Pattern\Assignments\Opera\Assignment #6 & #7 (Kmeans & Neural)\Dataset\Feature.mat' y labels;

Z = y' ;

T=ones(10,100);
T=T*-1 ;

T(1,1:10)=1;
T(2,11:20)=1;
T(3,21:30)=1;
T(4,31:40)=1;
T(5,41:50)=1;
T(6,51:60)=1;
T(7,61:70)=1;
T(8,71:80)=1;
T(9,81:90)=1;
T(10,91:100)=1;

net = newff(Z,T,neuronsNum,{'tansig','tansig'});

net.trainParam.epochs = interatNum ;
net = train(net,Z,T);

s = sim(net,Z);


end

