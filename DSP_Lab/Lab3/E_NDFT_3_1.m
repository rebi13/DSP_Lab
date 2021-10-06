
clc;
clear;

f_hat = 0.1;
N = 50;
n = 0 : 1 : N - 1;
x = cos(2*pi*f_hat*n); % 연속신호 x

subplot(211)
stem(n,x,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('x[n]');
grid on

[f_hat, X, N_mult] = NDFT(x); %연속신호 x를 주파수 도메인 성분으로 분해한 것
subplot(212)
stem(f_hat,abs(X),'k','MarkerFaceColor','k');
xlabel('f_h_a_t');
ylabel('|Xk|');
grid on


% 신호의 길이의 절반
% cos의 계수(세기)에 신호의길이를 곱하고 2를 나눈 값 도출. 2로 나눈건 기둥 하나씩 