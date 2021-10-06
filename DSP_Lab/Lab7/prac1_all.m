clc; clear;

n = 5;
Rp = 10; % baseband에서 허용하는 ripple의 크기
Rs = 30; % Stopband에서 허용하는 ripple의 크기
[z1,p1,k1] = buttap(n); % 5차 butterworth 필터
[z2,p2,k2] = cheb1ap(n,Rp); % 5차 Chebyshev Type-I 필터
[z3,p3,k3] = cheb2ap(n,Rs); % 5차 Chebyshev Type-II 필터
[z4,p4,k4] = ellipap(n,Rp,Rs); % 5차 Elliptic 필터
theta = 0:0.01:2*pi;
x = cos(theta);
y = sin(theta); % 원 그리기
[num1,den1] = zp2tf(z1,p1,k1); % 전달함수를 구하여 num, den에 저장
[num2,den2] = zp2tf(z2,p2,k2); % 전달함수를 구하여 num, den에 저장
[num3,den3] = zp2tf(z3,p3,k3); % 전달함수를 구하여 num, den에 저장
[num4,den4] = zp2tf(z4,p4,k4); % 전달함수를 구하여 num, den에 저장
w = linspace(0,2,1000);
h1 = freqs(num1,den1,w); % numt, dent에 대한 주파수 응답
h2 = freqs(num2,den2,w); % numt, dent에 대한 주파수 응답
h3 = freqs(num3,den3,w); % numt, dent에 대한 주파수 응답
h4 = freqs(num4,den4,w); % numt, dent에 대한 주파수 응답
dB_scale1 = 10*log10(abs(h1).^2); % dB-scale을 환산하여 표시
dB_scale2 = 10*log10(abs(h2).^2); % dB-scale을 환산하여 표시
dB_scale3 = 10*log10(abs(h3).^2); % dB-scale을 환산하여 표시
dB_scale4 = 10*log10(abs(h4).^2); % dB-scale을 환산하여 표시

figure(5)
subplot(4,2,1);
plot(x,y,':b','LineWidth',1.5)
grid on;
hold on;
plot(real(z1),imag(z1),'ko','MarkerSize',12,'LineWidth',1.5)
plot(real(p1),imag(p1),'kx','MarkerSize',12,'LineWidth',1.5)
subplot(4,2,2)
plot(w,dB_scale1,'k');
grid on;
axis([0 2 -40 5]);

subplot(4,2,3);
plot(x,y,':b','LineWidth',1.5)
grid on;
hold on;
plot(real(z2),imag(z2),'ko','MarkerSize',12,'LineWidth',1.5)
plot(real(p2),imag(p2),'kx','MarkerSize',12,'LineWidth',1.5)
subplot(4,2,4)
plot(w,dB_scale2,'k');
grid on;
axis([0 2 -40 5]);

subplot(4,2,5);
plot(x,y,':b','LineWidth',1.5)
grid on;
hold on;
plot(real(z3),imag(z3),'ko','MarkerSize',12,'LineWidth',1.5)
plot(real(p3),imag(p3),'kx','MarkerSize',12,'LineWidth',1.5)
subplot(4,2,6)
plot(w,dB_scale3,'k');
grid on;
axis([0 2 -40 5]);

subplot(4,2,7);
plot(x,y,':b','LineWidth',1.5)
grid on;
hold on;
plot(real(z4),imag(z4),'ko','MarkerSize',12,'LineWidth',1.5)
plot(real(p4),imag(p4),'kx','MarkerSize',12,'LineWidth',1.5)
subplot(4,2,8)
plot(w,dB_scale4,'k');
grid on;
axis([0 2 -40 5]);
