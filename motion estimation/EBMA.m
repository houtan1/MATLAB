%--------------------------------------------------------------------------
% ELEC 483 Assignment #4 Question 6.12
% Houtan Emad
% Feb 2, 2017
%--------------------------------------------------------------------------
% Write a C or Matlab code for implementing EBMA with integer-pel accuracy.
% Use block size of 16x16. Allow the user to choose the search range. Apply
% the program to two adjacent frames of a video sequence. Produce and plot
% the estimated motion field, the predicted frame, and the predicted error
% image. It should also calculate the PSNR of the predicted frame compared
% to the original tracked frame.
% Use train01.tif as the anchor frame (current), train02.tif as the target
% frame (reference). Generate the predicted (current) frame using the
% target image (reference) and displacement vectors, and display the
% prediction error.
%--------------------------------------------------------------------------

% First read in the inputs of search range (sr) and block size (N)
% [hardcoded as N=16 for a 16x16 block size. Also read in the anchor frame
% and target frame images. For good results, use an sr of 8 (used in both
% directions as +-8).

function EBMA

cimage = input('Name of anchor frame: ','s');
anchor = imread(cimage);
cimage = input('Name of target frame: ','s');
target = imread(cimage);
sr = input('Search range: ');

% Now call the EBMA evaluator function which takes in the search range sr
% and the block size of 16x16, and the anchor and target frame

EBMAeval([sr,sr],16,anchor,target);

% Define the function EBMAeval

function EBMAeval(sr,N,anchor,target)
ri = sr(1);
rj = sr(2);

% Display the anchor frame
figure
subplot(2,2,1)
imshow(anchor)
hold on

% Prep the frames
[m,n] = size(anchor);
anchor = double(anchor);
target = double(target);

% Calculate the min error and displacement vector for each block
for i=1:1:m/N
    for j=1:1:n/N
        i1=(i-1)*N+1;
        j1=(j-1)*N+1;
        e = 1000000;
        for k = max(1,i1-ri):1:min(m-N+1,i1+ri)
            for l=max(1,j1-rj):1:min(n-N+1,j1+rj)
                et=sum(sum(abs(target(k:k+N-1,l:l+N-1) -...
                    anchor(i1:i1+N-1,j1:j1+N-1))));
                if et < e
                    e = et;
                    dmi(i,j)=k-i1;
                    dmj(i,j)=l-j1;
                end
            end
        end
    predict_image(i1:i1+N-1,j1:j1+N-1)=target(dmi(i,j)+ ...
        i1:dmi(i,j)+i1+N-1,dmj(i,j)+j1:dmj(i,j)+j1+N-1);
    end
end

% define the error image and its PSNR

error_image = predict_image - anchor;
psnr = 10*log10(255*255/mean(mean(error_image.^2)));

% motion field plotted with quiver function, overlaid on anchor
[i,j] = meshgrid((N+1)/2:N:n,(N+1)/2:N:m);
quiver(i,j,dmi,dmj)
title('Anchor frame with motion field overlaid')
hold off

% display the motion field and its range
subplot(2,2,2)
dmi = -flipud(dmi);
dmj = flipud(dmj);
quiver(i,j,dmi,dmj)
axis([0 n 0 m]);
title(sprintf('Motion field with search range [%d, %d]', ri, rj))

% display the predicted frame
subplot(2,2,3)
imshow(uint8(predict_image))
title(sprintf('Predicted image (PSNR = %.4f)', psnr))

%display the prediction error image
subplot(2,2,4)
imshow(uint8(255-abs(error_image)))
title('Prediction error image (as complement)')

