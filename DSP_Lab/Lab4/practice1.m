
clear; clc; close all;
N=64; 
n=0:N-1;
lognumber=log2(N); % number of samples in the order of 2
x=cos(2*pi*0.1*n);
[f_hat,X_k,N_mult] = my_fft(x,N);
[f_ha1t,X_k1,N_mult1] = my_dft(x);

subplot(2,1,1);
stem(n,x,'k','MarkerFacecolor','k');
grid on;
axis([0,63,-1,1])
xlabel('n');ylabel('x[n]');

subplot(2,1,2);
stem(f_hat,abs(X_k(lognumber+1,:)),'k','MarkerFacecolor','k')
grid on;
xlabel('f_h_a_t');ylabel('|Xk|');

N_num = N_mult;

tic, my_fft(x,N); toc
tic, my_dft(x); toc % 처리 시간을 알 수 있음
% 경과 시간은 ********* 초입니다.





% N=50에 f_hat을 0.1을 넣으면 스펙트럼의 원소가 다 상쇄가 됨 주기가 딱 맞아서
% 여기서는 N=64에 f_hat을 0.1을 넣어서 60~63 구간이 남음 이 부분의 벡터가
% 상쇄가 안되서 옆에 조금씩 남는것. (이상적인 샘플링 주파수값이 안 나옴)

% x[n]이 한주기가 들어오면 위상각 성분 복소수를 벡터로 그려보면 전부 상쇄가 됨
% 코사인을 한주기 적분하게 되면 그 값은 0이기 때문에
% FFT에서는 길이를 2의 거듭제곱 형태로 나타내어야 하기 때문에
% 주파수값을 바꾸어주면 이상적인 샘플링 주파수를 알 수 있다.

% 0.1 주파수축으로 변환하면 0.1이 나옴
% DFT 성질상 음수를 해도 양수가 나옴 대칭성때문에
% 0.1 -0.1 나오는데 사실 매틀랩은 배열하면 음수 안나옴 배열인덱스는
% 처음에 양수나오는데 나중에 짤라서 붙여준다

% N으로하는건 시분할이 적어서 임펄스파형이 안나옴
% N 512 정도 나오면 제대로 된 임펄스함수가 나온다

