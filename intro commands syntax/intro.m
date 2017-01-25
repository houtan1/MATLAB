%-- assignment to variables
% right is assigned to the left
x = 3 + 4

%-- output and workspace
% semicolon supresses output, but the computation still happens and
% shows up in the workspace

y = x + 5;

% changing a variable value does not retroactively change other dependents
x = 2;
% y value hasn't changed until it's called/recalculated again

% all variables are cleared from the workspace by clear
clear

%-- command window
% clc clears command window
clc

%-- built-in constants have high precision
% pi is precise pi but only 4 decimals are shown
pi

% imaginary constant is denoted with i
i

%-- built-in functions
% absolute value
abs(3.4)

% eigenvalues
eig (4)

% sine function
sin (2.4)
x = pi/2;
y = sin(x)

% square root function
z = sqrt(-9)

clear
clc

%-- arrays
% all matlab variables are arrays
% single number, scalar, ia a 1x1 array
x = 4

% use square brackets [] for multiple element arrays
x = [7 9]

% space or comma , separates columns of data
x = [7,9]

% semicolons separates rows from each other
% you can also use this semicolon to move to a new line
x = [7;9]

y = [7;
    8;
    9]

z = [5 6 7;
    8 9 10]

% calculations within matricies also work
x = [sqrt(2) pi^2]

%-- evenly spaced vectors
% the : operator can be used to create a vector in a range
x = 1:3

% default begining:end spacing of 1
% custom begining:spacing:end
x = 1:0.5:5
x = 3:2:14

% to dictate the number of elements (as opposed to the spacing)
% use the linspace function
% linspace(first,last,number_of_elements)

x = linspace(1,10,5)

% turn row vectors into column vectors with the transpose operator '
x = x'

% parenthesis indicate order of operations
y = (1:2:5)'

clear
clc

%-- array creation functions
% create a random matrix of n by n by using rand(n) function

x = rand(5)

% or rows,columns rand(rows,columns)
x = rand(5,8)

% create a zeros column by zeros(rows,column)
y = zeros(4,2)

clear
clc

%-- saving and loading variables
% save a variable inside a mat file by command
% save (filename).mat (variable to store)

x = rand(8);
save foo x

% load the saved variables by calling its saved file
clear
% clears the workspace
load foo
% refills workspace with all variables previously saved in foo.mat

%-- importing data
% data files such as text files, spreadsheets, and images can be imported
% navigate to file location in the "current folder"
% right click on data to import > import data
% select portions of data you want to import and name it
% imported data shows up in the workspace now and can be used

%-- indexing into arrays
% extract values from an array using row,column indexing
% variable_to_store_in = MatrixName(row,column);

t = x(3,1)

% end means the last element
t = x(4,end)

% use arithmetic end-1 for second last
t = x(end-1, 2)

% extract multiple elements by using :
% : means all elements in that direction
% ex: w=x(2,:) means the variable t will hold a vector containing
% all elements from the 2nd row, and entire columns of matrix x

c = x(2,:)

% ex x = A(1:3,:) means extract the 1sr, 2nd, and 3rd rows (every column)
% from matrix A and put it in vector x

w = x(1:3,:)

% if only a row or column vector, extract single element with index value
% ex x = v(3) gives the 3rd element of row(or column) vector v

g = c(3)

% extract a range vector from a vector via x = v(3:end)
g = c(3:end)

%-- changing values in an array
% target a specific value in an array and change it by
% ArrayName(row,column) = NewValue

w
w(1,2) = 99

%-- performing array operations on vectors
clear
clc
data = rand(8,9)
density = data(:,2)
v1=data(:,3)
v2=data(:,4)

% adding a scalar value to all the elements of an array r = v1 + 1
r = v1 + 1

% add 2 arrays of the same size vs = v1 = v2
vs = v1 + v2

% multiply or divide all elements by a scalar va = vs/2
va = vs/2

% maximum value of a vector extracted by vm = max(va)
vm = max(va)

% can also perform functions over all array elements
% ex: xSqrt = sqrt(x) or vr = round(va)

vr = round(va)

% vector multiplication using * will only work if the dimentions agree
% can take transpose of a vector to change its dimensions. Gives matrix
v_test = va * density'

% * is matrix multiplication (gives a matrix)
% .* is elementwise multiplication (multiply the corresponding elements
% of two equally sized arrays

mass = density .* va

%-- obtaining multiple outputs from function calls
% size of an array is given by size(arrayName)

dsize = size(data)

% can get 2 outputs from one function using []
% ex [xrow,xcol] = size(x)

[dr,dc] = size(data)

% if the max function is called with 2 outputs, the 2nd is the index
[vMax,ivMax] = max(v2)

%-- Matlab help
% use the help button in the Home tab and search
% use doc functionName to see help about that function
clear
clc

%-- random integer
x = randi([1,20],7,4)

%-- plotting vectors
data = x;
sample = data(:,1);
density = data(:,2);
v1 = data(:,3);
v2 = data(:,4);
mass1 = density.*v1;
mass2 = density.*v2;

% 2 vectors of the same length are plotted against each other using plot
% ex plot(xaxis,yaxis)
plot(sample,mass1)

% plot can have color, line style, marker style specified
% ex. plot(x,y,'r--o')
plot(sample,mass2,'r*')

% use hold on to plot the next graph on top of the previous
hold on
plot(sample,mass1,'ks')

% close all open figures by using close all command
close all

% plot a vector on y against numbers 1 to vector length range by plot(v1)
plot(v1)

% further define plots by stating property names and their values
plot(v1,'LineWidth',3)

% plot(x,yarguments,'line specifier','propertyname',property value)
plot(sample,v1,'ro-','LineWidth',4)

% labels can be added to plots retroactively
title('Sample Densities')
ylabel('Density (g/cm^3)')
legend('sample')

% plots can be made by selecting the x (and y) variables from the
% workspace, then clicking the plots tab and choosing a plot

%-- fast fourier transform
% use fft(array) to get its FFT

%-- number of elements in an array
% numel(array)

%-- absolute value
% abs(array)