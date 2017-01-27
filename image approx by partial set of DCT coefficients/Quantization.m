%--------------------------------------------------------------------------
% ELEC 483 Assignment #3 Question 9.9
% Houtan Emad
% Jan 26, 2017
%--------------------------------------------------------------------------
% Write a C or Matlab code that examines the effect of quantization in the
% DCT domain. Use 8x8 DCT, and choose the quantization stepsizes to be
% multiples of the normalization matrix given in Fig. 9.7. Try scale
% factors of 0.5, 1, 2, 4, 8, 16. What is the largest scale factor that
% still provides a satisfactory image?
%--------------------------------------------------------------------------
% The three sections of transform encoding are: transform, quantization,
% and binary encoding. Using the default normalization matrix
% recommended by the JPEG standards in figure 9.7. Divide the image into
% 8x8 non-overlapping blocks. Perform an 8x8 DCT to each block. Quantize
% the coefficients using the uniform quantizers (normalization matrix for
% different step sizes). Use a zigzag order, as before, for the DCT
% coefficients. The largest scale factor that still provides a satisfactory
% image is 2, as it still provides a PSNR of 30+, smooth edges, and no
% excessive blocking artifacts based on the two sample images.
%--------------------------------------------------------------------------

% create a function that loads and feeds the image into the quantization
% function and dictates the scale factor.

function question9_9

% load the image from file
cimage = input('Image to Quantize: ','s');
im = imread(cimage);

% use scale factor of 0.5
[reconIm,nonZeroCoeff,psnr] = quantizer(im,0.5);
figure(1)
imshow(uint8(reconIm));
title(sprintf('0.5 scale factor with PSNR = %.4f, %d nonzero coefficients)',...
    psnr, nonZeroCoeff))
print -deps2 image_sf_0

% use scale factor of 1
[reconIm,nonZeroCoeff,psnr] = quantizer(im,1);
figure(2)
imshow(uint8(reconIm));
title(sprintf('1 scale factor with PSNR = %.4f, %d nonzero coefficients)',...
    psnr, nonZeroCoeff))
print -deps2 image_sf_1

% use scale factor of 2
[reconIm,nonZeroCoeff,psnr] = quantizer(im,2);
figure(3)
imshow(uint8(reconIm));
title(sprintf('2 scale factor with PSNR = %.4f, %d nonzero coefficients)',...
    psnr, nonZeroCoeff))
print -deps2 image_sf_2

% use scale factor of 4
[reconIm,nonZeroCoeff,psnr] = quantizer(im,4);
figure(4)
imshow(uint8(reconIm));
title(sprintf('4 scale factor with PSNR = %.4f, %d nonzero coefficients)',...
    psnr, nonZeroCoeff))
print -deps2 image_sf_4

% use scale factor of 8
[reconIm,nonZeroCoeff,psnr] = quantizer(im,8);
figure(5)
imshow(uint8(reconIm));
title(sprintf('8 scale factor with PSNR = %.4f, %d nonzero coefficients)',...
    psnr, nonZeroCoeff))
print -deps2 image_sf_8

% use scale factor of 16
[reconIm,nonZeroCoeff,psnr] = quantizer(im,16);
figure(6)
imshow(uint8(reconIm));
title(sprintf('16 scale factor with PSNR = %.4f, %d nonzero coefficients)',...
    psnr, nonZeroCoeff))
print -deps2 image_sf_16

% create a function that takes in an image and the number of coefficients
% to keep, and returns the reconstrcted image, the number of nonzero
% coefficients, and the PSNR of the reconstructed image for benchmarking

function [reconIm,nonZeroCoeff,psnr] = quantizer(origIm,retainedCoeff)

% convert original image to double precision
origIm = double(origIm);

% replicate the normalization matrix for quantization
q = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];

% use the built-in dct function and the normalization matrix to quantize
im_q = blkproc(origIm,[8,8],'round(dct2(x)./P1).*P1',q*retainedCoeff);
nonZeroCoeff = length(find(im_q ~= 0));
reconIm = blkproc(im_q,[8,8],'idct2');
psnr = 10*log10(255*255/mean(mean((origIm - reconIm).^2)));