
clc;
clear;

f_hat = 0.1;
N = 50;
n = 0 : 1 : N - 1;
x = cos(2*pi*f_hat*n); % ���ӽ�ȣ x

subplot(211)
stem(n,x,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('x[n]');
grid on

[f_hat, X, N_mult] = NDFT(x); %���ӽ�ȣ x�� ���ļ� ������ �������� ������ ��
subplot(212)
stem(f_hat,abs(X),'k','MarkerFaceColor','k');
xlabel('f_h_a_t');
ylabel('|Xk|');
grid on


% ��ȣ�� ������ ����
% cos�� ���(����)�� ��ȣ�Ǳ��̸� ���ϰ� 2�� ���� �� ����. 2�� ������ ��� �ϳ��� 