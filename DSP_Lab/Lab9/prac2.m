
clc; clear;

[y,fs] = audioread('Audio_Pop01_15sec.wav');
% 음성 파일을 읽어서 시간축 신호 y와 샘플링 주파수 fs 추출
Wn = 1/pi;
f = linspace(0,5000,100000); % 구간 설정
w = 2*pi*f;

Wn1 = 2*pi*500*Wn;
Wn2 = [2*pi*500*Wn,2*pi*1500*Wn];
Wn3 = [2*pi*1500*Wn,2*pi*2500*Wn];
Wn4 = [2*pi*2500*Wn,2*pi*3500*Wn];
Wn5 = 2*pi*3500*Wn;
[num1,den1] = butter(7, Wn1/fs, 'low');
[num2,den2] = butter(6, Wn2/fs, 'bandpass');
[num3,den3] = butter(6, Wn3/fs, 'bandpass');
[num4,den4] = butter(6, Wn4/fs, 'bandpass');
[num5,den5] = butter(10, Wn5/fs, 'high');
% [num, den] = butter(n, Wn, ftype)
% n = 필터의 차수, Wn = 정규화된 컷오프 주파수(pi로 나눔)
% ftype은 필터의 형태를 나타낸다.

dig1 = freqz(num1, den1, w./fs);
dig2 = freqz(num2, den2, w./fs);
dig3 = freqz(num3, den3, w./fs);
dig4 = freqz(num4, den4, w./fs);
dig5 = freqz(num5, den5, w./fs);

figure(2)
grid on;
hold on;
plot(f, abs(dig1), 'b','LineWidth',1.5);
plot(f, abs(dig2), 'g','LineWidth',1.5);
plot(f, abs(dig3), 'r','LineWidth',1.5);
plot(f, abs(dig4), 'c','LineWidth',1.5);
plot(f, abs(dig5), 'm','LineWidth',1.5);
xlabel('Frequency [Hz]');
ylabel('Frequency response, lH(f)l');
legend('Channel 1 filter', 'Channel 2 filter', 'Channel 3 filter',...
       'Channel 4 filter', 'Channel 5 filter')
axis([0 5000 0 1.4])

%===================================================================

theta = 0:0.01:2*pi;
circlex = cos(theta);
circley = sin(theta); % 원 그리기
[z1,p1,k1] = tf2zp(num1,den1); % 전달함수로부터 p와 z를 구함
[z2,p2,k2] = tf2zp(num2,den2); % 전달함수로부터 p와 z를 구함
[z3,p3,k3] = tf2zp(num3,den3); % 전달함수로부터 p와 z를 구함
[z4,p4,k4] = tf2zp(num4,den4); % 전달함수로부터 p와 z를 구함
[z5,p5,k5] = tf2zp(num5,den5); % 전달함수로부터 p와 z를 구함

figure(3)
subplot(2,3,1)
plot(circlex,circley,':b','LineWidth',1.5)
axis([-1.2 1.2 -1.2 1.2]); grid on; hold on;
plot(real(z1),imag(z1),'go','LineWidth',1.2)
plot(real(p1),imag(p1),'rx','LineWidth',1.2)
xlabel('Ch1 filter');
subplot(2,3,2)
plot(circlex,circley,':b','LineWidth',1.5)
axis([-1.2 1.2 -1.2 1.2]); grid on; hold on;
plot(real(z2),imag(z2),'go','LineWidth',1.2)
plot(real(p2),imag(p2),'rx','LineWidth',1.2)
xlabel('Ch2 filter');
subplot(2,3,3)
plot(circlex,circley,':b','LineWidth',1.5)
axis([-1.2 1.2 -1.2 1.2]); grid on; hold on;
plot(real(z3),imag(z3),'go','LineWidth',1.2)
plot(real(p3),imag(p3),'rx','LineWidth',1.2)
xlabel('Ch3 filter');
subplot(2,3,4)
plot(circlex,circley,':b','LineWidth',1.5)
axis([-1.2 1.2 -1.2 1.2]); grid on; hold on;
plot(real(z4),imag(z4),'go','LineWidth',1.2)
plot(real(p4),imag(p4),'rx','LineWidth',1.2)
xlabel('Ch4 filter');
subplot(2,3,5)
plot(circlex,circley,':b','LineWidth',1.5)
axis([-1.2 1.2 -1.2 1.2]); grid on; hold on;
plot(real(z5),imag(z5),'go','LineWidth',1.2)
plot(real(p5),imag(p5),'rx','LineWidth',1.2)
xlabel('Ch5 filter');