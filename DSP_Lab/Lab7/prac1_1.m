
clc; clear;

n = 5;
[z,p,k] = buttap(n); % 5차 butterworth 필터
theta = 0:0.01:2*pi;
x = cos(theta);
y = sin(theta); % 원 그리기

figure(1)
subplot(2,1,1);
plot(x,y,':b','LineWidth',1.5)
grid on;
hold on;

plot(real(z),imag(z),'ko','MarkerSize',12,'LineWidth',1.5)
plot(real(p),imag(p),'kx','MarkerSize',12,'LineWidth',1.5)
xlabel('Real(s)');
ylabel('Imag(s), Butterworth');

[num,den] = zp2tf(z,p,k); % 전달함수를 구하여 num, den에 저장
w = linspace(0,2,1000);
h = freqs(num,den,w); % num, den에 대한 주파수 응답

dBscale = 10*log10(abs(h).^2); % dB-scale을 환산하여 표시
subplot(2,1,2)
plot(w,dBscale,'k');
grid on;
axis([0 2 -40 5]);
xlabel('frequency w');
ylabel('|H(w)|^2 [dB], Butterworth');
