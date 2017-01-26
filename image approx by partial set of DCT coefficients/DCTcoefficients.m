%--------------------------------------------------------------------------
% ELEC 483 Assignment #3 Question 9.8
% Houtan Emad
% Jan 25, 2017
%--------------------------------------------------------------------------
% Write a C or Matlab code that examines the effect of approximating an
% image with a partial set of DCT coefficients. Use 8 x 8 DCT, reconstruct
% the image with K < 64 coefficients, for K = 4; 8; 16; 32: How many
% coefficients are necessary to provide a satisfactory reconstruction?
%--------------------------------------------------------------------------
% In order to approximate the image with DCT coefficients, we need to
% define the basis vectors of the 1-D n-point DCT by (9.1.26-28) and
% the forward and inverse transforms by (9.1.29-30). First apply that 1-D
% DCT to each row of the image block, and then apply the 1-D DCT to each
% column of the row transformed block. The coefficients are ordered using
% a zigzag scan. With only 16 out of 64 coefficients, we can already
% represent the original block quite well.
%--------------------------------------------------------------------------

% create a function that loads and feeds the image into the coefficients
% function and dictates the number of saved coefficients

function question9_8

% read an image as input
cimage = input('Image to DCT: ','s');
im = imread(cimage);

% use 4 coefficients
[reconIm,nonZeroCoeff,psnr] = coefficients(im,4);
figure(1)
imshow(uint8(reconIm))
title(sprintf('4 coefficients with PSNR = %.4f, %d nonzero coefficients in total)',...
    psnr, nonZeroCoeff))
print -deps2 image_4

% use 8 coefficients
[reconIm,nonZeroCoeff,psnr] = coefficients(im,8);
figure(2)
imshow(uint8(reconIm))
title(sprintf('8 coefficients with PSNR = %.4f, %d nonzero coefficients in total)',...
    psnr, nonZeroCoeff))
print -deps2 image_8

% use 16 coefficients
[reconIm,nonZeroCoeff,psnr] = coefficients(im,16);
figure(3)
imshow(uint8(reconIm))
title(sprintf('16 coefficients with PSNR = %.4f, %d nonzero coefficients in total)',...
    psnr, nonZeroCoeff))
print -deps2 image_16

% use 32 coefficients
[reconIm,nonZeroCoeff,psnr] = coefficients(im,32);
figure(4)
imshow(uint8(reconIm))
title(sprintf('32 coefficients with PSNR = %.4f, %d nonzero coefficients in total)',...
    psnr, nonZeroCoeff))
print -deps2 image_32

% create a function that takes in an image and the number of coefficients
% to keep, and returns the reconstrcted image, the number of nonzero
% coefficients, and the PSNR of the reconstructed image for benchmarking

function [reconIm,nonZeroCoeff,psnr] = coefficients(origIm,retainedCoeff)

% convert original image to double precision
origIm = double(origIm);

% use the built-in dct function to dct and inverse dct the image
aMatrix = ones(1,retainedCoeff);
cIm = blkproc(origIm,[8,8],'round(dct2(x)).*P1',zigzag(aMatrix,8));
nonZeroCoeff = length(find(cIm ~= 0));
reconIm = blkproc(cIm,[8,8],'idct2');
psnr = 10*log10(255*255/mean(mean((origIm - reconIm).^2)));

% create a function for the zigzag order, as no zigzag function exists
function zzout = zigzag(vectA,sizeB)

% create a blank matrix of sizeB x sizeB
zzout = zeros(sizeB);
n = 0;

% change the size of vector A with respect to the size of B
if length(vectA) < (sizeB^2)
    vectA = [vectA, zeros(1,sizeB^2-length(vectA))];
else
    vectA = vectA(1:sizeB^2);
end

% move in a zigzag pattern, filling out zzout
for k = 1:sizeB
    n = n+k-1;
    for i = 1:k
        if rem(k,2) == 0
            zzout(i,k+1-i) = vectA(n+i);
        else
            zzout(k+1-i,i) = vectA(n+i);
        end
    end
end
for k = 2:sizeB
    n = n+sizeB+1-k;
    for i = k:sizeB
        if rem((sizeB-k),2)==0
            zzout(k+sizeB-i,i) = vectA(n+i);
        else
            zzout(i,k+sizeB-i) = vectA(n+i);
        end
    end
end