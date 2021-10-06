clear; clc; 
%========== 3 - 1 ==========
pole = [1 0.3 0.36 0.108];
zero = [1 -0.3];
poleroots = roots(pole); %극점
zeroroots = roots(zero); %영점
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
H1 = (0.6667-0.5i)/(z-0.6i); %부분분수 전개
H2 = (0.6667+0.5i)/(z+0.6i); % 부분분수 전개
H3 = -1.3333/(z+0.3);
H = H1+H2+H3;
h=iztrans(H,z,n); % Z역변환을 통해 충격응답 함수를 구한다.
n1 = 0:20;
h = real(double(subs(h,n,n1))); % sub는 h를 시스템으로 돌린거 이거를 sub 하면 h가 나옴 그 n값에 n1이라는 시간영역을 대입해줌
% 허수가 나오다보니 real로 실수부만 나오도록 확인한다. double은 데이터형 바꿔준거밖에 없음 복소수니까

figure(6)

stem(n1,h,'filled','k');
axis([0,20,-0.6,1]);
grid on;
xlabel('n');
ylabel('h(n)');

%========== 3 - 3 ==========
w = linspace(-3,3,200);
[f,a]= freqz(zero,pole,w); %주파수 응답 
mag = abs(f);
 
figure(7)
plot(a,mag,'-k','LineWidth',2) 
grid on;
xlabel('Ω [rad/sec]');
ylabel('|H(Ω)|');