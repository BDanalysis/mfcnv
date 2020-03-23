%% ��������Ԥ�����

%% ��ջ�������
clc
clear

%% 1.����ѵ�����ݣ���Ϊ����Ĳ���
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
data_trains=[data_trains1;data_trains2;data_trains3;data_trains4;data_trains5;data_trains6];
column=[2,3,4,5];
[m1,n1] = size(data_trains);
trainLines = m1;
gdata(1:trainLines,:) = data_trains(1:trainLines,:);
% 1.1 ��1��trainlines���������
k=rand(1,trainLines);
[m,n]=sort(k);
% 1.2 �õ������������
ginput=gdata(:,column);
goutput1 =gdata(:,6);
% 1.3 �����һά�����ά����0����������1����gain��2����hemi_loss��3����homo_loss;
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

%% 2.��������
load('-mat','BPNN');

%% 3.���ز������ݲ�ͳ�ƽ��
num=50;
TP_count_sum=0;
TPFP_count_sum=0;
% 3.1 ѭ�����ز�������
for t=1:num
    % 3.1.1 ���ط�������
    data2=load(['C:\Users\Administrator\Desktop\data\data\tests\SimulationData_mat\0.2_4x_mat\sim', num2str(t) ,'_4_4100_read_trains.mat']);
    data_tests = data2.(['sim', num2str(t) ,'_4_4100_read_trains']);
    [m2,n2] = size(data_tests);
    testLines=m2;
    gdata2(1:testLines,:) = data_tests(1:m2,:);
    ginput2_bin=gdata2(:,1);
    ginput2=gdata2(:,column);
    goutput1 =gdata2(:,6);
    goutput2=zeros(testLines,4);
    for i=1:testLines
        switch goutput1(i)
            case 0
                goutput2(i,:)=[1 0 0 0];
            case 1
                goutput2(i,:)=[0 1 0 0];
            case 2
                goutput2(i,:)=[0 0 1 0];
	    case 3
                goutput2(i,:)=[0 0 0 1];
        end
    end
    ginput_test=ginput2((1:testLines),:)';
    goutput_test=goutput2((1:testLines),:)';
    %% 4.BP����Ԥ��
    % 4.1 Ԥ�����ݹ�һ��
    inputn_test=mapminmax('apply',ginput_test,ginputps);
    % 4.2 ����Ԥ�����
    an=sim(net,inputn_test);
    % 4.3 �����������һ��
    BPoutput=mapminmax('reverse',an,outputps);
    % 4.4 Ԥ�����
    error=BPoutput-goutput_test;
    abs_error=abs(error);
    errorsum=sum(abs(error));
    % 4.5 �����ļ���������ȷ��CNV���
    mkdir('C:\Users\Administrator\Desktop\data\','0.2_4x_binnumber');
    fid=fopen(['C:\Users\Administrator\Desktop\data\0.2_4x_binnumber\sim', num2str(t) ,'_4_4100_bin_number.txt'],'wt'); 
    TP_count=0;
    P_count=0;
    TPFP_count=0;
    k=1;
    % 4.6 �������ȷ��CNV���д���ļ�
    for q=1:testLines
        if ( abs_error(2,q) < abs_error(1,q) && abs_error(2,q) < abs_error(3,q) && abs_error(2,q) < abs_error(4,q) && goutput_test(2,q) == 1)
            fprintf(fid,'%d\t',ginput2_bin(q));
            fprintf(fid,'gain\t1');
            fprintf(fid,'\n');
            binnumber(k)=ginput2_bin(q);
            k=k+1;
        end
        if ( abs_error(3,q) < abs_error(1,q) && abs_error(3,q) < abs_error(2,q) && abs_error(3,q) < abs_error(4,q) && goutput_test(3,q) == 1)
            fprintf(fid,'%d\t',ginput2_bin(q));
            fprintf(fid,'hemi_loss\t2');
            fprintf(fid,'\n');
            binnumber(k)=ginput2_bin(q);
            k=k+1;
        end
        if ( abs_error(4,q) < abs_error(1,q) && abs_error(4,q) < abs_error(2,q) && abs_error(4,q) < abs_error(3,q) && goutput_test(4,q) == 1)
            fprintf(fid,'%d\t',ginput2_bin(q));
            fprintf(fid,'homo_loss\t3');
            fprintf(fid,'\n');
            binnumber(k)=ginput2_bin(q);
            k=k+1;
        end
        % 4.7 ͳ��recall��precision��F1-score
        if (( abs_error(2,q) < abs_error(1,q) && abs_error(2,q) < abs_error(3,q) && abs_error(2,q) < abs_error(4,q) && goutput_test(2,q) == 1) || ( abs_error(3,q) < abs_error(1,q) && abs_error(3,q) < abs_error(2,q) && abs_error(3,q) < abs_error(4,q) && goutput_test(3,q) == 1) || (abs_error(4,q) < abs_error(1,q) && abs_error(4,q) < abs_error(2,q) && abs_error(4,q) < abs_error(3,q) && goutput_test(4,q) == 1)) 
            TP_count=TP_count+1;
        end
        if ( goutput_test(2,q) == 1 || goutput_test(3,q) == 1 || goutput_test(4,q) == 1 )
            P_count=P_count+1;
        end
        if (  (abs_error(2,q) < abs_error(1,q) && abs_error(2,q) < abs_error(3,q) && abs_error(2,q) < abs_error(4,q) ) || ( abs_error(3,q) < abs_error(1,q) && abs_error(3,q) < abs_error(2,q) && abs_error(3,q) < abs_error(4,q)) || (abs_error(4,q) < abs_error(1,q) && abs_error(4,q) < abs_error(2,q) && abs_error(4,q) < abs_error(3,q)) )
            TPFP_count=TPFP_count+1;
        end
    end
    fclose(fid);
    TPFP_count_sum=TPFP_count_sum+TPFP_count;
    TP_count_sum=TP_count_sum+TP_count;
end

%% 5.ͳ�����ս��
TP_count_avg=TP_count_sum/num;
TPFP_count_avg=TPFP_count_sum/num;
recall=TP_count_avg/P_count;
precision=TP_count_avg/TPFP_count_avg;
F1_score=(2*recall*precision)/(recall+precision);
disp('sensitivity:');
disp(recall);
disp('precision:');
disp(precision);
disp('F1-score:');
disp(F1_score);
