%--------------------------------------------------------------------------
% ELEC 485 Assignment #1 Question 3
% Houtan Emad
% Feb 16, 2017
%--------------------------------------------------------------------------
% Data in Data3 belongs to 3 classes, the third column denotes the class.
% Read the data file, separate the 3 classes.
Data3 = importdata('Data3');

set1 = Data3(1:1000,1:2);
set2 = Data3(1001:2000,1:2);
set3 = Data3(2001:3000,1:2);

% a) for each class estimate its mean and covariance, assuming that data in
% each class follows p(x)~N(u,S)

mean1 = mean(set1);
mean2 = mean(set2);
mean3 = mean(set3);

cov1 = cov(set1);
cov2 = cov(set2);
cov3 = cov(set3);

% b) Use Mahalanobis distance to assign each of the unclassified data
% points to one of the three classes.
x1 = [10,2];
x2 = [-3,4];
x3 = [2,2];
x4 = [5,-7];

x1s1 = mahal(x1,set1); % 69.6884
x1s2 = mahal(x1,set2); % 318.8359
x1s3 = mahal(x1,set3); % 86.2760
% therefore x1 is in class 1

x2s1 = mahal(x2,set1); % 88.1832
x2s2 = mahal(x2,set2); % 56.4075
x2s3 = mahal(x2,set3); % 102.4631
% therefore x2 is in class 2

x3s1 = mahal(x3,set1); % 32.4344
x3s2 = mahal(x3,set2); % 11.8043
x3s3 = mahal(x3,set3); % 33.9243
% therefore x3 is in class 2

x4s1 = mahal(x4,set1); % 233.1643
x4s2 = mahal(x4,set2); % 236.2594
x4s3 = mahal(x4,set3); % 34.7343
% therefore x4 is in class 3

figure()
scatter(set1(:,1),set1(:,2),'r')
hold on
scatter(set2(:,1),set2(:,2),'b')
scatter(set3(:,1),set3(:,2),'c')
scatter(x1(1,1),x1(1,2),'kx')
scatter(x2(1,1),x2(1,2),'k+')
scatter(x3(1,1),x3(1,2),'k*')
scatter(x4(1,1),x4(1,2),'kv')

% d) Without the priori knowledge (i.e. classes 1,2,3 provided), my
% estimations of the classes for the unclassified points would have been
% less accurate e) plot decision boundaries