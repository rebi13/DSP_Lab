clc; clear;

n = 5;
Rp = 10; % baseband���� ����ϴ� ripple�� ũ��
Rs = 30; % Stopband���� ����ϴ� ripple�� ũ��
[z1,p1,k1] = buttap(n); % 5�� butterworth ����
[z2,p2,k2] = cheb1ap(n,Rp); % 5�� Chebyshev Type-I ����
[z3,p3,k3] = cheb2ap(n,Rs); % 5�� Chebyshev Type-II ����
[z4,p4,k4] = ellipap(n,Rp,Rs); % 5�� Elliptic ����
theta = 0:0.01:2*pi;
x = cos(theta);
y = sin(theta); % �� �׸���
[num1,den1] = zp2tf(z1,p1,k1); % �����Լ��� ���Ͽ� num, den�� ����
[num2,den2] = zp2tf(z2,p2,k2); % �����Լ��� ���Ͽ� num, den�� ����
[num3,den3] = zp2tf(z3,p3,k3); % �����Լ��� ���Ͽ� num, den�� ����
[num4,den4] = zp2tf(z4,p4,k4); % �����Լ��� ���Ͽ� num, den�� ����
w = linspace(0,2,1000);
h1 = freqs(num1,den1,w); % numt, dent�� ���� ���ļ� ����
h2 = freqs(num2,den2,w); % numt, dent�� ���� ���ļ� ����
h3 = freqs(num3,den3,w); % numt, dent�� ���� ���ļ� ����
h4 = freqs(num4,den4,w); % numt, dent�� ���� ���ļ� ����
dB_scale1 = 10*log10(abs(h1).^2); % dB-scale�� ȯ���Ͽ� ǥ��
dB_scale2 = 10*log10(abs(h2).^2); % dB-scale�� ȯ���Ͽ� ǥ��
dB_scale3 = 10*log10(abs(h3).^2); % dB-scale�� ȯ���Ͽ� ǥ��
dB_scale4 = 10*log10(abs(h4).^2); % dB-scale�� ȯ���Ͽ� ǥ��

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
