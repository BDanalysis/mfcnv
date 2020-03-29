%% 清空环境变量
clc;
clear all
close all
nntwarn off;
warning off;
%% 数据载入

for k =1:50
    load(['E:\Desktop\two_tezhengzhi\gc_normal\0.2_4x\sim',num2str(k),'_4_4100_tests.txt']);
    save(['E:\Desktop\two_tezhengzhi\gc_normal\tests\0.2_4x_mat\sim',num2str(k),'_4_4100_tests.mat'],['sim',num2str(k),'_4_4100_tests']);
    load(['E:\Desktop\two_tezhengzhi\gc_normal\0.2_6x\sim',num2str(k),'_6_6100_tests.txt']);
    save(['E:\Desktop\two_tezhengzhi\gc_normal\tests\0.2_6x_mat\sim',num2str(k),'_6_6100_tests.mat'],['sim',num2str(k),'_6_6100_tests']);
    load(['E:\Desktop\two_tezhengzhi\gc_normal\0.3_4x\sim',num2str(k),'_4_4100_tests.txt']);
    save(['E:\Desktop\two_tezhengzhi\gc_normal\tests\0.3_4x_mat\sim',num2str(k),'_4_4100_tests.mat'],['sim',num2str(k),'_4_4100_tests']);
    load(['E:\Desktop\two_tezhengzhi\gc_normal\0.3_6x\sim',num2str(k),'_6_6100_tests.txt']);
    save(['E:\Desktop\two_tezhengzhi\gc_normal\tests\0.3_6x_mat\sim',num2str(k),'_6_6100_tests.mat'],['sim',num2str(k),'_6_6100_tests']);
    load(['E:\Desktop\two_tezhengzhi\gc_normal\0.4_4x\sim',num2str(k),'_4_4100_tests.txt']);
    save(['E:\Desktop\two_tezhengzhi\gc_normal\tests\0.4_4x_mat\sim',num2str(k),'_4_4100_tests.mat'],['sim',num2str(k),'_4_4100_tests']);
    load(['E:\Desktop\two_tezhengzhi\gc_normal\0.4_6x\sim',num2str(k),'_6_6100_tests.txt']);
    save(['E:\Desktop\two_tezhengzhi\gc_normal\tests\0.4_6x_mat\sim',num2str(k),'_6_6100_tests.mat'],['sim',num2str(k),'_6_6100_tests']);
end

load(['E:\Desktop\two_tezhengzhi\gc_normal\s02_4x_sim1_trains.txt']);
save(['E:\Desktop\two_tezhengzhi\gc_normal\trains\0.2_4x_sim1_trains.mat'],['s02_4x_sim1_trains']);
load(['E:\Desktop\two_tezhengzhi\gc_normal\s03_4x_sim1_trains.txt']);
save(['E:\Desktop\two_tezhengzhi\gc_normal\trains\0.3_4x_sim1_trains.mat'],['s03_4x_sim1_trains']);
load(['E:\Desktop\two_tezhengzhi\gc_normal\s04_4x_sim1_trains.txt']);
save(['E:\Desktop\two_tezhengzhi\gc_normal\trains\0.4_4x_sim1_trains.mat'],['s04_4x_sim1_trains']);
load(['E:\Desktop\two_tezhengzhi\gc_normal\s02_6x_sim1_trains.txt']);
save(['E:\Desktop\two_tezhengzhi\gc_normal\trains\0.2_6x_sim1_trains.mat'],['s02_6x_sim1_trains']);
load(['E:\Desktop\two_tezhengzhi\gc_normal\s03_6x_sim1_trains.txt']);
save(['E:\Desktop\two_tezhengzhi\gc_normal\trains\0.3_6x_sim1_trains.mat'],['s03_6x_sim1_trains']);
load(['E:\Desktop\two_tezhengzhi\gc_normal\s04_6x_sim1_trains.txt']);
save(['E:\Desktop\two_tezhengzhi\gc_normal\trains\0.4_6x_sim1_trains.mat'],['s04_6x_sim1_trains']);



