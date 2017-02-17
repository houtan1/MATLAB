%--------------------------------------------------------------------------
% ELEC 485 Assignment #1 Question 2
% Houtan Emad
% Feb 16, 2017
%--------------------------------------------------------------------------
% write a function to generate N random data samples with mean
% u=[u_x1,u_x2]^T E=[...]
u=[5,5]';
sx1=2;
sx2=1;
s=[sx1^2,sx1*sx2;
    sx2*sx1,sx2^2];
N=1000;
R=mvnrnd(u,s,N);

% a) with given p as correlation coefficient, generate 3 sets of data
p1= -0.8;
p2= 0.2;
p3= 0.9;

s1=[sx1^2,p1*sx1*sx2;
    p1*sx2*sx1,sx2^2];
R1=mvnrnd(u,s,N);

s2=[sx1^2,p2*sx1*sx2;
    p2*sx2*sx1,sx2^2];
R2=mvnrnd(u,s,N);

s3=[sx1^2,p3*sx1*sx2;
    p3*sx2*sx1,sx2^2];
R3=mvnrnd(u,s,N);

% b) produce a 2-D scatter plot for each generated data set
figure(1)
scatter(R1(:,1),R1(:,2));
figure(2)
scatter(R2(:,1),R2(:,2));
figure(3)
scatter(R3(:,1),R3(:,2));

% c) ovelay the eigenvectors of s and draw the 1 2 3-s ellipses
[v,d]=eig(s);
