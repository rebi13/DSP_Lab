
clc; clear;

n = 7;
[z,p,k] = buttap(n); % 7차 Butterworth 필터
[num,den] = zp2tf(z,p,k); % 전달함수를 구하여 num, den에 저장

fc = 300;
fs = 3000;
f = linspace(0,5500,1100000); % 구간 설정
w = 2*pi*f;

[numt,dent] = lp2lp(num,den,fc*2*pi);
[dig_numd, dig_dend] = bilinear(numt,dent,fs); % 아날로그 시스템 이산화
h_anal = freqs(numt,dent,w); % num, den에 대한 주파수 응답
h_dig = freqz(dig_numd,dig_dend,w./fs); % numd, dend에 대한 주파수 응답

f1 = 100; f2 = 500; 
n = linspace(0,499,500); % 신호의 길이
t = n/fs; % 시간축 샘플링
xn = cos(2*pi*f1*t) + cos(2*pi*f2*t); % 이산신호 x[n]
yn = filter(dig_numd,dig_dend,xn); % 디지털 시스템의 출력
[f_x, X] = myfun_SA(t, xn); % x[n]의 크기 스펙트럼
[f_y, Y] = myfun_SA(t, yn); % y[n]의 크기 스펙트럼

figure(5)
subplot(3,2,1) % 입력신호 x[n]
plot(t,xn,'k','LineWidth',1.7);
axis([0 0.1 -2 2]);
grid on;
xlabel('t [sec]');
ylabel('x(t)');

subplot(3,2,2) % 입력신호 x[n]의 크기 스펙트럼
plot(f_x,abs(X),'-ok','LineWidth',1.7);
axis([0 600 0 0.08]);
grid on;
xlabel('Frequency, f_x [Hz]');
ylabel('lX(f)l');

subplot(3,2,4) % 디지털 필터 H_d(z)의 주파수 응답의 크기
plot(f,abs(h_dig),'k','LineWidth',1.7);
axis([0 600 0 1]);
grid on;
xlabel('Frequency, f [Hz]');
ylabel('Frequency response, lH_d(f)l');

subplot(3,2,5) % 출력신호 y[n]
plot(t,yn,'k','LineWidth',1.7);
axis([0 0.1 -1.5 1.5]);
grid on;
xlabel('t [sec]');
ylabel('y(t)');

subplot(3,2,6) % 출력신호 y[n]의 크기 스펙트럼
plot(f_y,abs(Y),'-ok','LineWidth',1.7);
axis([0 600 0 0.08]);
grid on;
xlabel('Frequency, f_y [Hz]');
ylabel('lY(f)l');
