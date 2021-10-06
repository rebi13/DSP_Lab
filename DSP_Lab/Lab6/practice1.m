clear; clc; 

pole = [1 2 5]; % 분모: s^2+2s+5
zero = [1 5];   %분자: s+5 

poleroots = roots(pole);  %분모 다항식의 해
zeroroots = roots(zero);  %분자 다항식의 해

figure(1)
plot(real(poleroots),imag(poleroots),'xk',real(zeroroots),imag(zeroroots),'ok','MarkerSize',15,'LineWidth',3) 
grid on;
axis([-6,0,-2.5,2.5])
xlabel('Real(s)');
ylabel('Imag(s)');

[r,p,k] = residue(zero,pole)

syms  s
H1 = (0.5-i)/(s+1-2i); %부분분수 전개
H2 = (0.5+i)/(s+1+2i); % 부분분수 전개
H = (H1+H2); 
h = matlabFunction(ilaplace(H)) % ilapalace plot하기 위한 함수, 역 라플라스 변환을 통하여 h(t) 함수를 구한다.
t = linspace(0,10,1000);

figure(2)
plot(t,h(t),'-k','LineWidth',2);
grid on;
xlabel('t[sec]');
ylabel('h(t)');

w = linspace(-4,4,200);
f= freqs(zero,pole,w); % 주파수 응답함수
mag = abs(f); % 절대값으로 표현
 
figure(3)
plot(w,mag,'-k','LineWidth',2) 
grid on;
xlabel('Ω [rad/sec]');
ylabel('|H(Ω)|');
