
clear; clc; close all;
N=64; 
n=0:N-1;
lognumber=log2(N); % number of samples in the order of 2
x=0.3*cos(2*pi*0.1*n)+0.8*sin(2*pi*0.3*n);
[f_hat,X_k,N_mult] = my_fft(x,N);
[f_hat1,X_k1,N_mult1] = my_dft(x,N);

subplot(2,1,1);
stem(n,x,'k','MarkerFacecolor','k');
grid on;
axis([0,63,-2,2])
xlabel('n');ylabel('x[n]');

subplot(2,1,2);
plot(f_hat1,abs(X_k1),':ok')
grid on;
xlabel('f_h_a_t');ylabel('|Xk|');
DFT_N = N_mult1;

hold on;
plot(f_hat,abs(X_k(lognumber+1,:)),':xr')
grid on;
xlabel('f_h_a_t');ylabel('|Xk|');
FFT_num = N_mult;

legend('DFT','FFT');


%주파수 0.1 0.3 쓰는데 
% FT하면 0.1 0.3 나옴
% 대칭성 이용해서 -01 -03 나옴

%FFT dft하는데 여기서는 이런 개념보단 

%연산수가 줄어들어서 회로 구성에 용이하다.