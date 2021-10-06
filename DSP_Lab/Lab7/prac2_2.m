
clc; clear;

Ps = -40;
ps = 10.^(Ps/10); % ps�� ���ϱ� ���� ���� ����
dw = 1;
n = ceil((log10(1./ps - 1)./(2*log10(1+dw)))); % ������ ���Ͽ� �ø���

[z,p,k] = buttap(n); % 7�� Butterworth ����
[num,den] = zp2tf(z,p,k); % �����Լ��� ���Ͽ� num, den�� ����

[numt1,dent1] = lp2lp(num,den,300); % cutoff ���ļ�
[numt2,dent2] = lp2bp(num,den,650,700); % �߽����ļ�, �뿪��
[numt3,dent3] = lp2bp(num,den,1500,1000); % �߽����ļ�, �뿪��
[numt4,dent4] = lp2bp(num,den,3000,2000); % �߽����ļ�, �뿪��
[numt5,dent5] = lp2hp(num,den,4000); % cutoff ���ļ�
% numt,dent�� ��ȯ�� ������ �����Լ��� ����,�и��� ��� ����
% �뿪���� �� �������ļ��� ������
w = linspace(0,5000,100000);
h1 = freqs(numt1,dent1,w); % numt, dent�� ���� ���ļ� ����
h2 = freqs(numt2,dent2,w); % numt, dent�� ���� ���ļ� ����
h3 = freqs(numt3,dent3,w); % numt, dent�� ���� ���ļ� ����
h4 = freqs(numt4,dent4,w); % numt, dent�� ���� ���ļ� ����
h5 = freqs(numt5,dent5,w); % numt, dent�� ���� ���ļ� ����

dB_scale1 = 10*log10(abs(h1).^2); % dB-scale�� ȯ���Ͽ� ǥ��
dB_scale2 = 10*log10(abs(h2).^2); % dB-scale�� ȯ���Ͽ� ǥ��
dB_scale3 = 10*log10(abs(h3).^2); % dB-scale�� ȯ���Ͽ� ǥ��
dB_scale4 = 10*log10(abs(h4).^2); % dB-scale�� ȯ���Ͽ� ǥ��
dB_scale5 = 10*log10(abs(h5).^2); % dB-scale�� ȯ���Ͽ� ǥ��

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