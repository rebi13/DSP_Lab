

clc; clear;

n = 5;
Rs = 30; % Stopband에서 허용하는 ripple의 크기
[z,p,k] = cheb2ap(n,Rs); % 5차 Chebyshev Type-II 필터

theta = 0:0.01:2*pi;
x = cos(theta);
y = sin(theta); % 원 그리기

figure(3)
subplot(2,1,1);
plot(x,y,':b','LineWidth',1.5)
grid on;
hold on;
plot(real(z),imag(z),'ko','MarkerSize',12,'LineWidth',1.5)
plot(real(p),imag(p),'kx','MarkerSize',12,'LineWidth',1.5)
xlabel('Real(s)');
ylabel('Imag(s), Chebyshev Type - ll');

[num,den] = zp2tf(z,p,k); % 전달함수를 구하여 num, den에 저장
w = linspace(0,2,1000000);
h = freqs(num,den,w); % num, den에 대한 주파수 응답

dB_scale = 10*log10(abs(h).^2); % dB-scale을 환산하여 표시
subplot(2,1,2)
plot(w,dB_scale,'k');
grid on;
%axis([0 2 -70 0]);
xlabel('frequency w');
ylabel('|H(w)|^2 [dB], Chebyshev Type - ll');
