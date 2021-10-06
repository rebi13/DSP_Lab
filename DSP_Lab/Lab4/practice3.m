
clear; clc; %close all;
N1=16; 
n=0:N1-1;
x=0.3*cos(2*pi*0.1*n)+0.8*sin(2*pi*0.3*n);
[f_hat,X_k,N_mult1] = my_fft(x,N1);
[f_hat1,X_k1,N_mult2] = my_dft(x);

FFT_num1 = N_mult1;
DFT_N1 = N_mult2;
%----------------------------------------------------------------------
N2=32; 
n=0:N2-1;
x=0.3*cos(2*pi*0.1*n)+0.8*sin(2*pi*0.3*n);
[f_hat2,X_k2,N_mult3] = my_fft(x,N2);
[f_hat3,X_k3,N_mult4] = my_dft(x);

FFT_num2 = N_mult3;
DFT_N2 = N_mult4;
%----------------------------------------------------------------------
N3=64; 
n=0:N3-1;
x=0.3*cos(2*pi*0.1*n)+0.8*sin(2*pi*0.3*n);
[f_hat4,X_k4,N_mult5] = my_fft(x,N3);
[f_hat5,X_k5,N_mult6] = my_dft(x);

FFT_num3 = N_mult5;
DFT_N3 = N_mult6;
%----------------------------------------------------------------------
N4=128; 
n=0:N4-1;
x=0.3*cos(2*pi*0.1*n)+0.8*sin(2*pi*0.3*n);
[f_hat6,X_k6,N_mult7] = my_fft(x,N4);
[f_hat7,X_k7,N_mult8] = my_dft(x);

FFT_num4 = N_mult7;
DFT_N4 = N_mult8;
%-----------------------------------------------------------------
DFT = [DFT_N1,DFT_N2,DFT_N3,DFT_N4];
FFT = [FFT_num1,FFT_num2,FFT_num3,FFT_num4];
n =[N1,N2,N3,N4];
figure(2)
subplot(2,1,1)
semilogy(n,DFT,'-ob',n,FFT,'-^g')
grid on;
xlabel('N');ylabel('number of multiplications');
legend('DFT','FFT');

subplot(2,1,2)
Ratio = FFT./DFT;
plot (n,Ratio,'-ok')
grid on;
xlabel('N');ylabel('Ration of FFT computations over DFT');


% N차가 커질수록 FFT의 계산량이 줄어들면서 DFT보다 FFT의 방식이 더 좋다.