
clc; clear;

Ps = -40;
ps = 10.^(Ps/10); % ps�� ���ϱ� ���� ���� ����
dw = 1;
n = ceil((log10(1./ps - 1)./(2*log10(1+dw)))); % ������ ���Ͽ� �ø���
[z,p,k] = buttap(n); % 7�� Butterworth ����
theta = 0:0.01:2*pi;
x = cos(theta);
y = sin(theta); % �� �׸���

figure(6)
subplot(2,1,1);
plot(x,y,':b','LineWidth',1.5)
grid on;
hold on;

plot(real(z),imag(z),'ko','MarkerSize',12,'LineWidth',1.5)
plot(real(p),imag(p),'kx','MarkerSize',12,'LineWidth',1.5)
xlabel('Real(s)');
ylabel('Imag(s), Butterworth');

[num,den] = zp2tf(z,p,k); % �����Լ��� ���Ͽ� num, den�� ����
w = linspace(0,2.5,1000);
h = freqs(num,den,w); % num, den�� ���� ���ļ� ����

dB_scale = 10*log10(abs(h).^2); % dB-scale�� ȯ���Ͽ� ǥ��
subplot(2,1,2)
plot(w,dB_scale,'k');
grid on;
axis([0 2.5 -50 5]);
xlabel('frequency w');
ylabel('|H(w)|^2 [dB], Butterworth');