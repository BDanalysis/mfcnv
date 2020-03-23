%% BP神经网络训练程序

%% 清空环境变量
clc
clear

%% 1.训练数据提取及归一化
data1=load('C:\Users\Administrator\Desktop\data\data\trains\0.2_4x_sim31_4_4100_read_trains.mat');
data2=load('C:\Users\Administrator\Desktop\data\data\trains\0.2_6x_sim31_6_6100_read_trains.mat');
data3=load('C:\Users\Administrator\Desktop\data\data\trains\0.3_4x_sim31_4_4100_read_trains.mat');
data4=load('C:\Users\Administrator\Desktop\data\data\trains\0.3_6x_sim31_6_6100_read_trains.mat');
data5=load('C:\Users\Administrator\Desktop\data\data\trains\0.4_4x_sim31_4_4100_read_trains.mat');
data6=load('C:\Users\Administrator\Desktop\data\data\trains\0.4_6x_sim31_6_6100_read_trains.mat');
data_trains1 = data1.('sim31_4_4100_read_trains');
data_trains2 = data2.('sim31_6_6100_read_trains');
data_trains3 = data3.('sim31_4_4100_read_trains');
data_trains4 = data4.('sim31_6_6100_read_trains');
data_trains5 = data5.('sim31_4_4100_read_trains');
data_trains6 = data6.('sim31_6_6100_read_trains');
data_trains=[data_trains1;data_trains2;data_trains3;data_trains5;data_trains6;];
column=[2,3,4,5];
[m1,n1] = size(data_trains);
trainLines = m1;
gdata(1:trainLines,:) = data_trains(1:trainLines,:);
% 1.1 从1到trainLines间随机排序
k=rand(1,trainLines);
[m,n]=sort(k);
% 1.2 得到输入输出数据
ginput=gdata(:,column);
goutput1 =gdata(:,6);
% 1.3 输出从一维变成四维：0——正常，1——gain，2——hemi_loss，3——homo_loss;
goutput=zeros(trainLines,4);
for i=1:trainLines
    switch goutput1(i)
        case 0
            goutput(i,:)=[1 0 0 0];
        case 1
            goutput(i,:)=[0 1 0 0];
        case 2
            goutput(i,:)=[0 0 1 0];
        case 3
            goutput(i,:)=[0 0 0 1];
    end
end
% 1.4 找出训练数据
ginput_train=ginput(n(1:trainLines),:)';
goutput_train=goutput(n(1:trainLines),:)';
% 1.5 样本输入输出数据归一化
[ginputn,ginputps]=mapminmax(ginput_train);
[outputn,outputps]=mapminmax(goutput_train);

%% 2.BP网络训练
% 2.1 初始化网络结构
net=newff(ginputn,goutput_train,25);
net.trainParam.epochs=200;
net.trainParam.lr=0.1;
net.trainParam.goal=0.00004;
% 2.2 网络训练
net=train(net,ginputn,goutput_train);
% 2.3 网络保存
save ('BPNN','net');


