
clc; clear;

n = 3;
theta = 0:0.01:2*pi;
x = cos(theta);
y = sin(theta); % �� �׸���

[z,p,k] = buttap(n); % 3�� butterworth ����
[num,den] = zp2tf(z,p,k); % �����Լ��� ���Ͽ� num, den�� ����

fs1 = 5; fs2 = 10;
[numd1, dend1] = bilinear(num,den,fs1); % �Ƴ��α� �ý��� �̻�ȭ
[numd2, dend2] = bilinear(num,den,fs2); % �Ƴ��α� �ý��� �̻�ȭ
[z1,p1,k1] = tf2zp(numd1,dend1); % �����Լ��κ��� p�� z�� ����
[z2,p2,k2] = tf2zp(numd2,dend2); % �����Լ��κ��� p�� z�� ����

% ============================== # 1

figure(1)

subplot(3,1,1);
plot(x,y,':b','LineWidth',1.5)
axis([-1.2 1.2 -1.2 1.2]);
grid on;
hold on;
plot(real(z),imag(z),'ko','MarkerSize',12,'LineWidth',1.5)
plot(real(p),imag(p),'kx','MarkerSize',12,'LineWidth',1.5)
xlabel('Real(s)');
ylabel('Imag(s)');

subplot(3,1,2);
plot(x,y,':b','LineWidth',1.5)
axis([-1.2 1.2 -1.2 1.2]);
grid on;
hold on;
plot(real(z1),imag(z1),'ko','MarkerSize',12,'LineWidth',1.5)
plot(real(p1),imag(p1),'kx','MarkerSize',12,'LineWidth',1.5)
xlabel('Real(s)');
ylabel('Imag(s)');

subplot(3,1,3);
plot(x,y,':b','LineWidth',1.5)
axis([-1.2 1.2 -1.2 1.2]);
grid on;
hold on;
plot(real(z2),imag(z2),'ko','MarkerSize',12,'LineWidth',1.5)
plot(real(p2),imag(p2),'kx','MarkerSize',12,'LineWidth',1.5)
xlabel('Real(s)');
ylabel('Imag(s)');

% ============================== # 2

figure(2)

w = linspace(0,2,1000); % �Ƴ��α� ���ļ� w ����
Omega_5 = w./fs1; % ������ ���ļ� Omega_5 ���� (ǥ��ȭ ���ļ� fs1 = 5)
Omega_10 = w./fs2; % ������ ���ļ� Omega_10 ���� (ǥ��ȭ ���ļ� fs2 = 10)
h1 = freqs(num,den,w); % num, den�� ���� ���ļ� ����
h2 = freqz(numd1,dend1,Omega_5); % numd1, dend1�� ���� ���ļ� ����
h3 = freqz(numd2,dend2,Omega_10); % numd2, dend2�� ���� ���ļ� ����
% h2, h3�� �Ƴ��α� �ý����� �̻�ȭ�� �� (=������ �ý���)
% ������ �ý��� �����Լ��κ����� ���ļ� ������ ���� ����

subplot(2,1,1)
plot(w,abs(h1),'b','LineWidth',3);
axis([0 2 0 1.4]);
grid on;
hold on;
plot(w,abs(h2),'g','LineWidth',2.5); % �Ƴ��α� ���Ϳ� ������ ������
plot(w,abs(h3),'r','LineWidth',2); % �Ƴ��α� ���Ϳ� ������ ������
xlabel('Frequency w [rad/sec]');
ylabel('lH(w)l');
legend('Analog Butterworth Filter', 'Digital Butterworth Filter, f_s = 5Hz', 'Digital Butterworth Filter, f_s = 10Hz');

subplot(2,1,2)
plot(w,abs(h1),'b','LineWidth',3);
axis([0.9 1.1 0.6 0.8]);
grid on;
hold on;
plot(w,abs(h2),'g','LineWidth',2.5); % �Ƴ��α� ���Ϳ� ������ ������
plot(w,abs(h3),'r','LineWidth',2); % �Ƴ��α� ���Ϳ� ������ ������
xlabel('Frequency w [rad/sec]');
ylabel('lH(w)l');
legend('Analog Butterworth Filter', 'Digital Butterworth Filter, f_s = 5Hz', 'Digital Butterworth Filter, f_s = 10Hz');

% ============================== # 3

figure(6)

L = [50 100 1000];
n1 = 0:L(1)-1; n2 = 0:L(2)-1; n3 = 0:L(3)-1;
xn1 = zeros(1,L(1)); xn1(1) = 1; % �迭�� ù ��Ҹ� 1�� ����
xn2 = zeros(1,L(2)); xn2(1) = 1; % �迭�� ù ��Ҹ� 1�� ����
xn3 = zeros(1,L(3)); xn3(1) = 1; % �迭�� ù ��Ҹ� 1�� ����
yn1 =filter(numd2,dend2,xn1); % ������ �ý����� ����� ����
yn2 =filter(numd2,dend2,xn2); % ������ �ý����� ����� ����
yn3 =filter(numd2,dend2,xn3); % ������ �ý����� ����� ����

subplot(3,1,1);
stem(n1,yn1,'k','MarkerFaceColor','k');
grid on;
axis([0 L(1) 0 0.05]);
xlabel('n');
ylabel('h[n], L=50');
subplot(3,1,2);
stem(n2,yn2,'k','MarkerFaceColor','k');
grid on;
axis([0 L(2) -0.02 0.06]);
xlabel('n');
ylabel('h[n], L=100');
subplot(3,1,3);
stem(n3,yn3,'k','MarkerFaceColor','k');
grid on;
axis([0 L(3) -0.02 0.06]);
xlabel('n');
ylabel('h[n], L=150');

% ============================== # 4