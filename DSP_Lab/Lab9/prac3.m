
clc; clear;

[y,fs] = audioread('Audio_Pop01_15sec.wav');
% ���� ������ �о �ð��� ��ȣ y�� ���ø� ���ļ� fs ����
t = linspace(0, 15, length(y));
% 0���� 15���� ��ȣ�� ���̸�ŭ �߶�
Wn = 1/pi; % ����ȭ
f = linspace(0,5000,100000); % ���� ����

ch1 = 2*pi*500*Wn;
ch2 = [2*pi*500*Wn,2*pi*1500*Wn];
ch3 = [2*pi*1500*Wn,2*pi*2500*Wn];
ch4 = [2*pi*2500*Wn,2*pi*3500*Wn];
ch5 = 2*pi*3500*Wn;
[num1,den1] = butter(7, ch1/fs, 'low');
[num2,den2] = butter(6, ch2/fs, 'bandpass');
[num3,den3] = butter(6, ch3/fs, 'bandpass');
[num4,den4] = butter(6, ch4/fs, 'bandpass');
[num5,den5] = butter(10, ch5/fs, 'high');
% [num, den] = butter(n, Wn, ftype)
% n = ������ ����, Wn = ����ȭ�� �ƿ��� ���ļ�(pi�� ����)
% ftype�� ������ ���¸� ��Ÿ����.

yn1 =filter(num1,den1,y); % ������ �ý����� ����� ����
yn2 =filter(num2,den2,y); % ������ �ý����� ����� ����
yn3 =filter(num3,den3,y); % ������ �ý����� ����� ����
yn4 =filter(num4,den4,y); % ������ �ý����� ����� ����
yn5 =filter(num5,den5,y); % ������ �ý����� ����� ����

figure(4)
subplot(5,2,1)
plot(t,yn1,'k'); grid on;
xlabel('Time [sec]'); ylabel('Ch1 out, y[n]');
axis([0 15 -0.1 0.1])
[f1,X1] = myfun_SA(t,yn1);
subplot(5,2,2)
plot(f1,abs(X1),'k'); grid on;
xlabel('Frequency [Hz]');
axis([0 5000 0 0.015])
% sound(yn1,fs);

subplot(5,2,3)
plot(t,yn2,'k'); grid on;
xlabel('Time [sec]'); ylabel('Ch2 out, y[n]');
axis([0 15 -0.05 0.05])
[f2,X2] = myfun_SA(t,yn2);
subplot(5,2,4)
plot(f2,abs(X2),'k'); grid on;
xlabel('Frequency [Hz]');
axis([0 5000 0 0.006])
% sound(yn2,fs);

subplot(5,2,5)
plot(t,yn3,'k'); grid on;
xlabel('Time [sec]'); ylabel('Ch3 out, y[n]');
axis([0 15 -0.05 0.05])
[f3,X3] = myfun_SA(t,yn3);
subplot(5,2,6)
plot(f3,abs(X3),'k'); grid on;
xlabel('Frequency [Hz]');
axis([0 5000 0 0.0006])
% sound(yn3,fs);

subplot(5,2,7)
plot(t,yn4,'k'); grid on;
xlabel('Time [sec]'); ylabel('Ch4 out, y[n]');
axis([0 15 -0.02 0.02])
[f4,X4] = myfun_SA(t,yn4);
subplot(5,2,8)
plot(f4,abs(X4),'k'); grid on;
xlabel('Frequency [Hz]');
axis([0 5000 0 0.0004])
% sound(yn4,fs);

subplot(5,2,9)
plot(t,yn5,'k');grid on;
xlabel('Time [sec]'); ylabel('Ch5 out, y[n]');
axis([0 15 -0.02 0.02])
[f5,X5] = myfun_SA(t,yn5);
subplot(5,2,10)
plot(f5,abs(X5),'k'); grid on;
xlabel('Frequency [Hz]');
axis([0 5000 0 0.0004])
% sound(yn5,fs);

%=============================================
C = [1 5 4 2 1];
Master_w = 1; % Master volume ����
mix_y1 = yn1 * C(1); % ä���̵��� ���Ͽ� �ͽ�
mix_y2 = yn2 * C(2); % ä���̵��� ���Ͽ� �ͽ�
mix_y3 = yn3 * C(3); % ä���̵��� ���Ͽ� �ͽ�
mix_y4 = yn4 * C(4); % ä���̵��� ���Ͽ� �ͽ�
mix_y5 = yn5 * C(5); % ä���̵��� ���Ͽ� �ͽ�
mix_y = mix_y1+mix_y2+mix_y3+mix_y4+mix_y5; % �ͼ� ���
c0 = sqrt(sum(y.^2) /sum(mix_y.^2)); % ����� ��ȣ�� ������ ���߱� ����
c0_mix_y = mix_y * c0;

Master_mix_y = c0_mix_y * Master_w;

figure(5)
title('c1=1.0, c2=5.0, c3=4.0, c4=2.0, c5=1.0, w=1.0');
subplot(2,1,1)
plot(t,y,'r');
grid on;
hold on;
plot(t,Master_mix_y,'k');
axis([0 15 -0.2 0.2])
xlabel('Time [sec]');
ylabel('Audio Signal');
legend('Input', 'Output');
[f_org,X_org] = myfun_SA(t,y); % ���� ����� ��ȣ
[f_mix,X_mix] = myfun_SA(t,Master_mix_y); % ��ȣ�� ũ�� ����Ʈ��
subplot(2,1,2)
plot(f_org,abs(X_org),'r');
grid on;
hold on;
plot(f_mix,abs(X_mix),'k');
axis([0 5000 0 0.015])
xlabel('Frequency [Hz]');
ylabel('Magitude spectrum');
legend('Input', 'Output');
