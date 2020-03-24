# mfcnv
A method for detecting CNV  using neural networks
#Table of Contents
Folder information

Usage of mfcnv

Output

Platform
1.Folder information
There are four directories. 1.program This directory contains three files that have been coded, including code for training the model, for detecting simulation data and for detecting real data. 2.test This directory contains two subdirectories including RealData_mat and SimulationData_mat. 3.trains This directory contains three sets of data, you can train the model with any set of data from them and then detect other data using this model. 4.result This directory contains a table with all statistical results and two sub-directories, which are real data results and simulation data results.

2.Usage of mfcnv
The program must be run in matlab 2016a.
Step 1:
Open the bpcnv_train file, changing the load (' ') in 1 to the user's file address,and run.
Step 2:
(1) test simulation data:
Open the bpcnv_test_simulation file and change the load (' ') in 1 to the user's file address.
Change the load (' ') in 3.1.1 to the user's file address.
Change the mkdir (' ') and fopen (' ') in 4.5 to the user's file address,and run.
(2) test real data:
Open the bpcnv_test_real file and change the load (' ') in 1 to the user's file address.
Change the load (' ') in 3 to the user's file address.
Change fopen (' ') in 5.2 to the user's file address,and run.

3.Output
The end of the program will generate result files in the root directory and show the precision, sensitivity and F1-score in the matlab window. These result files have a total of three volumns. (1): the position where the mutation occurred (2): variation type including gain, hemi_loss and homo_loss (3): this volumn is 1, 2 or 3 corresponding to the second volumn.

4.Platform
The program must be run in matlab 2016a on windows system.
