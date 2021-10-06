
clc;
clear;
N1 = 50;
N2 = 1024;
t = linspace(0,N2 - 1,N2); % N2를 0부터 N2까지 N2등분
n = 0:1:N1-1;
L = [1 10 30 50];

x1 = [ones(1,L(1)), zeros(1,N1-L(1))]; % L(1)까지는 1, 그 뒤로는 전부 0
x2 = [ones(1,L(2)), zeros(1,N1-L(2))]; % L(2)까지는 1, 그 뒤로는 전부 0
x3 = [ones(1,L(3)), zeros(1,N1-L(3))]; % L(3)까지는 1, 그 뒤로는 전부 0
x4 = [ones(1,L(4)), zeros(1,N1-L(4))]; % L(4)까지는 1, 그 뒤로는 전부 0

figure(3)
subplot(421)
stem(n,x1,'k','MarkerFaceColor','k');
axis([0 50 0 1]);
grid on

subplot(422)
[f_hat1, X1] = NDFT(x1);
plot(f_hat1,abs(X1),'or');
hold on
Y = t < L(1); %L(1)이 1이므로 0까지 1
[f_hat_1, X_1] = NDFT(Y);
plot(f_hat_1,abs(X_1),'k','Linewidth',2);
axis([-0.5 0.5 0 2]);
legend('DFT','DTFT','location','northEast');
grid on

subplot(423)
stem(n,x2,'k','MarkerFaceColor','k');
axis([0 50 0 1]);
[f_hat2, X2] = NDFT(x2);
grid on

subplot(424)
plot(f_hat2,abs(X2),'or');
hold on
Y = t < L(2); %L(2)이 10이므로 9까지 1
[f_hat_2, X_2] = NDFT(Y);
plot(f_hat_2,abs(X_2),'k','Linewidth',2);
axis([-0.5 0.5 0 10]);
legend('DFT','DTFT','location','northEast');
grid on

subplot(425)
stem(n,x3,'k','MarkerFaceColor','k');
axis([0 50 0 1]);
grid on

subplot(426)
[f_hat3, X3] = NDFT(x3);
plot(f_hat3,abs(X3),'or');
hold on
Y = t < L(3); %L(3)이 30이므로 29까지 1
[f_hat_3, X_3] = NDFT(Y);
plot(f_hat_3,abs(X_3),'k','Linewidth',2);
axis([-0.5 0.5 0 30]);
legend('DFT','DTFT','location','northEast');
grid on

subplot(427)
stem(n,x4,'k','MarkerFaceColor','k');
axis([0 50 0 1]);
grid on

subplot(428)
[f_hat4, X4] = NDFT(x4);
plot(f_hat4,abs(X4),'or');
hold on
Y = t < L(4); %L(4)이 50이므로 49까지 1
[f_hat_4, X_4] = NDFT(Y);
plot(f_hat_4,abs(X_4),'k','Linewidth',2);
axis([-0.5 0.5 0 60]);
legend('DFT','DTFT','location','northEast');
grid on

% 왜 점점 줄어들까? 교차점이 펄스폭에 반비례하기 때문