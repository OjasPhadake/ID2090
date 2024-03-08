#because loops are to be used
clc;
close all;
clear all;

image = imread('Image_mount.jpg');
d = image(:, :, :);

k1 = [1 4 6 4 1; 4 16 24 16 4; 6 24 -476 24 6;4 16 24 16 4;1 4 6 4 1]*-1/256;
k2 = [1 1 2 1 1; 2 2 4 2 2; 0 0 1 0 0; -2 -2 -4 -2 -2; -1 -1 -2 -1 -1];
k3 = [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1]*1/25;

[r c l] = size(image);
H = zeros(r-4, c-4, 3);
d = double(d);

for i = 1:5,
  for j = 1:5,
    for k = 1:3,
      H(:, :, k) = H(:, :, k) + k3(i,j)*d(i:r-5+i,j:c-5+j,k) ;
    endfor
  endfor
endfor
H=uint8(H);
d=uint8(d);

figure(1);
title('Original image vs Prewitt-convolution-kernel modified image');
subplot(1,2,1);
imshow(d);
subplot(1,2,2);
imshow(H);

#figure(2);
#xlabel('Value of x');
#ylabel('Value of pixel out of 255');
#subplot(1,2,1);
#hist(d(1:1000,1:1000, 1))
#subplot(1,2,2);
#hist(H(1:1000,1:1000, 1))
