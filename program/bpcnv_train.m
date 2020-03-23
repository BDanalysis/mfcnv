%% BP������ѵ������

%% ��ջ�������
clc
clear

%% 1.ѵ��������ȡ����һ��
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
% 1.1 ��1��trainLines���������
k=rand(1,trainLines);
[m,n]=sort(k);
% 1.2 �õ������������
ginput=gdata(:,column);
goutput1 =gdata(:,6);
% 1.3 �����һά�����ά��0����������1����gain��2����hemi_loss��3����homo_loss;
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
% 1.4 �ҳ�ѵ������
ginput_train=ginput(n(1:trainLines),:)';
goutput_train=goutput(n(1:trainLines),:)';
% 1.5 ��������������ݹ�һ��
[ginputn,ginputps]=mapminmax(ginput_train);
[outputn,outputps]=mapminmax(goutput_train);

%% 2.BP����ѵ��
% 2.1 ��ʼ������ṹ
net=newff(ginputn,goutput_train,25);
net.trainParam.epochs=200;
net.trainParam.lr=0.1;
net.trainParam.goal=0.00004;
% 2.2 ����ѵ��
net=train(net,ginputn,goutput_train);
% 2.3 ���籣��
save ('BPNN','net');


