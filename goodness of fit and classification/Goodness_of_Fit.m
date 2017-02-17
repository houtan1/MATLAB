%--------------------------------------------------------------------------
% ELEC 485 Assignment #1 Question 1
% Houtan Emad
% Feb 16, 2017
%--------------------------------------------------------------------------
% Using the Chi-Squared (X^2) goodness of fit test, determine whther the
% data set contained in the files Data1 and Data2 can be reasonable modeled
% by a Gaussian distribution at an alpha (a) = 0.05 confidence level.
%--------------------------------------------------------------------------
% a) plot the histogram for each data set

% read the two data sets: Data1 and Data2
Data1 = importdata('Data1');
Data2 = importdata('Data2');

% plot the histogram for each data set
figure(1)
%subplot(1,2,1)
histogram(Data1)
title('Data1 Histogram')
% range is -2 to 12, 0 to 120
%subplot(1,2,2)
figure(2)
histogram(Data2)
title('Data2 Histogram')

% b) overlay the best fit Gaussian (same as normal) on this histogram plot
figure(1)
histfit(Data1)
title('Data1 Histogram with Best Fit Gaussian')

figure(2)
histfit(Data2)
title('Data2 Histogram with Best Fit Gaussian')

% c) provide the results of the X^2 goodness-of-fit test for each data
% sets, inclusive of its computed p-value
[h1,p1] = chi2gof(Data1) % h1=0, p1=0.3307
[h2,p2] = chi2gof(Data2) % h2=1, p2=1.1277e-41
% results: h1=0, h2=1, meaning Gaussian distribution is a good fit for
% Data1 but not a good fit for Data2

% d) fot the data set(s) that fail the X^2 goodness-of-fit test for
% Gaussian p(x), determine which p(x) distribution does provide a
% reasonable model for the data

% assuming that Data2 fits an exponential distribution, using fitdist to
% get the probability distribution of that fit
pd = fitdist(Data2','Exponential');
% use the pd as cdf of hypothesized distribution for chi2gof
[h3,p3] = chi2gof(Data2,'CDF',pd) % h3=0, p3=0.1304
% results: h3=0 meaning Exponential distribution is a good fit for Data2