clear; clc; 
X= myfun_LoadImage('lena.raw',256, 256);
figure(1);
subplot(1,3,1)
imshow(X);

Z =(1/(256*256)*fft2(X));
subplot(1,3,2)
imshow(abs(Z))

Z_inv = (256*256)*ifft2(Z);
subplot(1,3,3)
Z_inv = uint8(Z_inv);
imshow(Z_inv);
