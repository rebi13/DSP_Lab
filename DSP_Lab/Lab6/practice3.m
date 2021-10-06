clear; clc; 
%========== 3 - 1 ==========
pole = [1 0.3 0.36 0.108];
zero = [1 -0.3];
poleroots = roots(pole); %����
zeroroots = roots(zero); %����
theta = 0:0.01:2*pi;

x = cos(theta);
y = sin(theta);
figure(5)

plot(x,y,':k','LineWidth',1.5)
grid on;
hold on;
plot(real(zeroroots),imag(zeroroots),'ok',real(poleroots),imag(poleroots),'xk','MarkerSize',15,'LineWidth',3)
xlabel('Real(z)')
ylabel('Imag(z)')
axis([-1 1 -1 1])


%========== 3 - 2 ==========
[r,p,k] = residue(zero,pole);

syms  z n
H1 = (0.6667-0.5i)/(z-0.6i); %�κкм� ����
H2 = (0.6667+0.5i)/(z+0.6i); % �κкм� ����
H3 = -1.3333/(z+0.3);
H = H1+H2+H3;
h=iztrans(H,z,n); % Z����ȯ�� ���� ������� �Լ��� ���Ѵ�.
n1 = 0:20;
h = real(double(subs(h,n,n1))); % sub�� h�� �ý������� ������ �̰Ÿ� sub �ϸ� h�� ���� �� n���� n1�̶�� �ð������� ��������
% ����� �����ٺ��� real�� �Ǽ��θ� �������� Ȯ���Ѵ�. double�� �������� �ٲ��ذŹۿ� ���� ���Ҽ��ϱ�

figure(6)

stem(n1,h,'filled','k');
axis([0,20,-0.6,1]);
grid on;
xlabel('n');
ylabel('h(n)');

%========== 3 - 3 ==========
w = linspace(-3,3,200);
[f,a]= freqz(zero,pole,w); %���ļ� ���� 
mag = abs(f);
 
figure(7)
plot(a,mag,'-k','LineWidth',2) 
grid on;
xlabel('�� [rad/sec]');
ylabel('|H(��)|');