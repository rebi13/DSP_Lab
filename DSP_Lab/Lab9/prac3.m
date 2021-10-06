
clc; clear;

[y,fs] = audioread('Audio_Pop01_15sec.wav');
% 음성 파일을 읽어서 시간축 신호 y와 샘플링 주파수 fs 추출
t = linspace(0, 15, length(y));
% 0부터 15까지 신호의 길이만큼 잘라냄
Wn = 1/pi; % 정규화
f = linspace(0,5000,100000); % 구간 설정

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
% n = 필터의 차수, Wn = 정규화된 컷오프 주파수(pi로 나눔)
% ftype은 필터의 형태를 나타낸다.

yn1 =filter(num1,den1,y); % 디지털 시스템의 출력을 구함
yn2 =filter(num2,den2,y); % 디지털 시스템의 출력을 구함
yn3 =filter(num3,den3,y); % 디지털 시스템의 출력을 구함
yn4 =filter(num4,den4,y); % 디지털 시스템의 출력을 구함
yn5 =filter(num5,den5,y); % 디지털 시스템의 출력을 구함

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
Master_w = 1; % Master volume 정의
mix_y1 = yn1 * C(1); % 채널이득을 곱하여 믹싱
mix_y2 = yn2 * C(2); % 채널이득을 곱하여 믹싱
mix_y3 = yn3 * C(3); % 채널이득을 곱하여 믹싱
mix_y4 = yn4 * C(4); % 채널이득을 곱하여 믹싱
mix_y5 = yn5 * C(5); % 채널이득을 곱하여 믹싱
mix_y = mix_y1+mix_y2+mix_y3+mix_y4+mix_y5; % 믹서 출력
c0 = sqrt(sum(y.^2) /sum(mix_y.^2)); % 입출력 신호의 전력을 맞추기 위함
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
[f_org,X_org] = myfun_SA(t,y); % 샘플 오디오 신호
[f_mix,X_mix] = myfun_SA(t,Master_mix_y); % 신호의 크기 스펙트럼
subplot(2,1,2)
plot(f_org,abs(X_org),'r');
grid on;
hold on;
plot(f_mix,abs(X_mix),'k');
axis([0 5000 0 0.015])
xlabel('Frequency [Hz]');
ylabel('Magitude spectrum');
legend('Input', 'Output');
