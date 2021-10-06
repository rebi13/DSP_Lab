
clc; clear;

n = 7;
[z,p,k] = buttap(n); % 7�� Butterworth ����
[num,den] = zp2tf(z,p,k); % �����Լ��� ���Ͽ� num, den�� ����

fc = 300;
fs = 3000;
f = linspace(0,5500,1100000); % ���� ����
w = 2*pi*f;

[numt,dent] = lp2lp(num,den,fc*2*pi);
[dig_numd, dig_dend] = bilinear(numt,dent,fs); % �Ƴ��α� �ý��� �̻�ȭ
h_anal = freqs(numt,dent,w); % num, den�� ���� ���ļ� ����
h_dig = freqz(dig_numd,dig_dend,w./fs); % numd, dend�� ���� ���ļ� ����

f1 = 100; f2 = 500; 
n = linspace(0,499,500); % ��ȣ�� ����
t = n/fs; % �ð��� ���ø�
xn = cos(2*pi*f1*t) + cos(2*pi*f2*t); % �̻��ȣ x[n]
yn = filter(dig_numd,dig_dend,xn); % ������ �ý����� ���
[f_x, X] = myfun_SA(t, xn); % x[n]�� ũ�� ����Ʈ��
[f_y, Y] = myfun_SA(t, yn); % y[n]�� ũ�� ����Ʈ��

figure(5)
subplot(3,2,1) % �Է½�ȣ x[n]
plot(t,xn,'k','LineWidth',1.7);
axis([0 0.1 -2 2]);
grid on;
xlabel('t [sec]');
ylabel('x(t)');

subplot(3,2,2) % �Է½�ȣ x[n]�� ũ�� ����Ʈ��
plot(f_x,abs(X),'-ok','LineWidth',1.7);
axis([0 600 0 0.08]);
grid on;
xlabel('Frequency, f_x [Hz]');
ylabel('lX(f)l');

subplot(3,2,4) % ������ ���� H_d(z)�� ���ļ� ������ ũ��
plot(f,abs(h_dig),'k','LineWidth',1.7);
axis([0 600 0 1]);
grid on;
xlabel('Frequency, f [Hz]');
ylabel('Frequency response, lH_d(f)l');

subplot(3,2,5) % ��½�ȣ y[n]
plot(t,yn,'k','LineWidth',1.7);
axis([0 0.1 -1.5 1.5]);
grid on;
xlabel('t [sec]');
ylabel('y(t)');

subplot(3,2,6) % ��½�ȣ y[n]�� ũ�� ����Ʈ��
plot(f_y,abs(Y),'-ok','LineWidth',1.7);
axis([0 600 0 0.08]);
grid on;
xlabel('Frequency, f_y [Hz]');
ylabel('lY(f)l');
