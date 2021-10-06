
clc; clear;

n = 7;
[z,p,k] = buttap(n); % 7차 Butterworth 필터
[num,den] = zp2tf(z,p,k); % 전달함수를 구하여 num, den에 저장

fs = 100000;
f = linspace(0,5500,1100000); % 구간 설정
w = 2*pi*f;

[anal_numt1,anal_dent1] = lp2bp(num,den,3000*2*pi,2000*2*pi); 
[anal_numt2,anal_dent2] = lp2hp(num,den,4000*2*pi); 
% numt,dent가 변환된 필터의 전달함수의 분자,분모의 계수 벡터
% 대역폭은 두 차단주파수의 차이임
[dig_numd1, dig_dend1] = bilinear(anal_numt1,anal_dent1,fs);
[dig_numd2, dig_dend2] = bilinear(anal_numt2,anal_dent2,fs);

h_anal1 = freqs(anal_numt1,anal_dent1,w); % numt, dent에 대한 주파수 응답
h_anal2 = freqs(anal_numt2,anal_dent2,w); % numt, dent에 대한 주파수 응답
h_dig1 = freqz(dig_numd1, dig_dend1,w./fs); % numd, dend에 대한 주파수 응답
h_dig2 = freqz(dig_numd2, dig_dend2,w./fs); % numd, dend에 대한 주파수 응답

figure(4)
title(' fs = 100000 ')
grid on;
hold on;
plot(f,abs(h_anal1),'b','LineWidth',1.5);
plot(f,abs(h_dig1),'g','LineWidth',1.5);
plot(f,abs(h_anal2),'r','LineWidth',1.5);
plot(f,abs(h_dig2),'c','LineWidth',1.5);

axis([1500 5500 0 1.4]);
xlabel('Frquency, f [Hz]');
ylabel('|H(f)|');
legend('Analog BPF', 'Digital BPF', 'Analog HPF', 'Digital HPF');

