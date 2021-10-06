
clc; clear;

n = 7;
[z,p,k] = buttap(n); % 7�� Butterworth ����
[num,den] = zp2tf(z,p,k); % �����Լ��� ���Ͽ� num, den�� ����

fs = 100000;
f = linspace(0,5500,1100000); % ���� ����
w = 2*pi*f;

[anal_numt1,anal_dent1] = lp2bp(num,den,3000*2*pi,2000*2*pi); 
[anal_numt2,anal_dent2] = lp2hp(num,den,4000*2*pi); 
% numt,dent�� ��ȯ�� ������ �����Լ��� ����,�и��� ��� ����
% �뿪���� �� �������ļ��� ������
[dig_numd1, dig_dend1] = bilinear(anal_numt1,anal_dent1,fs);
[dig_numd2, dig_dend2] = bilinear(anal_numt2,anal_dent2,fs);

h_anal1 = freqs(anal_numt1,anal_dent1,w); % numt, dent�� ���� ���ļ� ����
h_anal2 = freqs(anal_numt2,anal_dent2,w); % numt, dent�� ���� ���ļ� ����
h_dig1 = freqz(dig_numd1, dig_dend1,w./fs); % numd, dend�� ���� ���ļ� ����
h_dig2 = freqz(dig_numd2, dig_dend2,w./fs); % numd, dend�� ���� ���ļ� ����

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

