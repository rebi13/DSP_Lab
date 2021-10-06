clc; clear;

[y,fs] = audioread('Audio_Pop01_15sec.wav'); 
% ���� ������ �о �ð��� ��ȣ y�� ���ø� ���ļ� fs ����
t = linspace(0, 15, length(y));
% 0���� 15���� ��ȣ�� ���̸�ŭ �߶�

figure(1)
subplot(2,1,1)
plot(t,y,'k'); % ���� ����� ��ȣ
grid on;
xlabel('Time [sec]');
ylabel('Input audio, x(t)');
axis([0 15 -0.1 0.1])
[f,X] = myfun_SA(t,y); % ��ȣ�� ũ�� ����Ʈ��
subplot(2,1,2)
plot(f,abs(X),'k');
grid on;
xlabel('Time [sec]');
ylabel('lX(f)l');
axis([0 5000 0 0.015])
sound(y,fs); % ���� ���


