
clc; clear;

Ps = -40;
ps = 10.^(Ps/10); % ps를 구하기 위해 식을 변형
dw = 1;
n = ceil((log10(1./ps - 1)./(2*log10(1+dw)))); % 차수를 구하여 올림수

[z,p,k] = buttap(n); % 7차 Butterworth 필터
[num,den] = zp2tf(z,p,k); % 전달함수를 구하여 num, den에 저장

[numt1,dent1] = lp2lp(num,den,300); % cutoff 주파수
[numt2,dent2] = lp2bp(num,den,650,700); % 중심주파수, 대역폭
[numt3,dent3] = lp2bp(num,den,1500,1000); % 중심주파수, 대역폭
[numt4,dent4] = lp2bp(num,den,3000,2000); % 중심주파수, 대역폭
[numt5,dent5] = lp2hp(num,den,4000); % cutoff 주파수
% numt,dent가 변환된 필터의 전달함수의 분자,분모의 계수 벡터
% 대역폭은 두 차단주파수의 차이임
w = linspace(0,5000,100000);
h1 = freqs(numt1,dent1,w); % numt, dent에 대한 주파수 응답
h2 = freqs(numt2,dent2,w); % numt, dent에 대한 주파수 응답
h3 = freqs(numt3,dent3,w); % numt, dent에 대한 주파수 응답
h4 = freqs(numt4,dent4,w); % numt, dent에 대한 주파수 응답
h5 = freqs(numt5,dent5,w); % numt, dent에 대한 주파수 응답

dB_scale1 = 10*log10(abs(h1).^2); % dB-scale로 환산하여 표시
dB_scale2 = 10*log10(abs(h2).^2); % dB-scale로 환산하여 표시
dB_scale3 = 10*log10(abs(h3).^2); % dB-scale로 환산하여 표시
dB_scale4 = 10*log10(abs(h4).^2); % dB-scale로 환산하여 표시
dB_scale5 = 10*log10(abs(h5).^2); % dB-scale로 환산하여 표시

figure(7)
grid on;
hold on;
plot(w,dB_scale1,'b','LineWidth',1.5);
plot(w,dB_scale2,'g','LineWidth',1.5);
plot(w,dB_scale3,'r','LineWidth',1.5);
plot(w,dB_scale4,'c','LineWidth',1.5);
plot(w,dB_scale5,'m','LineWidth',1.5);
axis([0 5000 -30 10]);
xlabel('Frquency, [Hz]');
ylabel('|H(w)|^2 [dB]');
legend('Filter 1, LPF','Filter 2, BPF','Filter 3, BPF','Filter 4, BPF','Filter 5, HPF')