
clc;
clear;

f_hat1 = 0.1;
f_hat2 = 0.2;
f_hat3 = 0.3;
N = 50;
n = 0 : 1 : N - 1;
x1 = cos(2*pi*f_hat1*n);
x2 = 0.5*cos(2*pi*f_hat2*n);
x3 = 0.1*cos(2*pi*f_hat3*n);
x = x1+x2+x3;

figure(2)
subplot(211)
stem(n,x,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('x[n]');
grid on

[f_hat, X, N_mult] = NDFT(x);
subplot(212)
stem(f_hat,abs(X),'k','MarkerFaceColor','k');
xlabel('f_h_a_t');
ylabel('|Xk|');
grid on