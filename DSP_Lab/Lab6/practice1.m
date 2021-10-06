clear; clc; 

pole = [1 2 5]; % �и�: s^2+2s+5
zero = [1 5];   %����: s+5 

poleroots = roots(pole);  %�и� ���׽��� ��
zeroroots = roots(zero);  %���� ���׽��� ��

figure(1)
plot(real(poleroots),imag(poleroots),'xk',real(zeroroots),imag(zeroroots),'ok','MarkerSize',15,'LineWidth',3) 
grid on;
axis([-6,0,-2.5,2.5])
xlabel('Real(s)');
ylabel('Imag(s)');

[r,p,k] = residue(zero,pole)

syms  s
H1 = (0.5-i)/(s+1-2i); %�κкм� ����
H2 = (0.5+i)/(s+1+2i); % �κкм� ����
H = (H1+H2); 
h = matlabFunction(ilaplace(H)) % ilapalace plot�ϱ� ���� �Լ�, �� ���ö� ��ȯ�� ���Ͽ� h(t) �Լ��� ���Ѵ�.
t = linspace(0,10,1000);

figure(2)
plot(t,h(t),'-k','LineWidth',2);
grid on;
xlabel('t[sec]');
ylabel('h(t)');

w = linspace(-4,4,200);
f= freqs(zero,pole,w); % ���ļ� �����Լ�
mag = abs(f); % ���밪���� ǥ��
 
figure(3)
plot(w,mag,'-k','LineWidth',2) 
grid on;
xlabel('�� [rad/sec]');
ylabel('|H(��)|');
