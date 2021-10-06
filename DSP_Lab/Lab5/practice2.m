clear; clc; 
X= myfun_LoadImage('lena.raw',256, 256);
figure(2);
subplot(1,3,1)
imshow(X);

Z =(1/256)*dct2(X);
subplot(1,3,2)
imshow(abs(Z))

Z_inv = 256*idct2(Z);
subplot(1,3,3)
Z_inv = uint8(Z_inv);
imshow(Z_inv);
