clear; clc;

sys1_zero = -5;
sys1_pole = [-1+2j, -1-2j];

[b1 ,a1]= zp2tf(sys1_zero,sys1_pole,1);

pole_1 = [1 2 5];
zero_1 = [1 5];
[r,p,k] = residue(zero_1,pole_1);

syms  s
H1 = (0.5-i)/(s+1-2i); %부분분수 전개
H2 = (0.5+i)/(s+1+2i); % 부분분수 전개
H = H1+H2;
h= matlabFunction(ilaplace(H)); % ilapalace plot하기 위한 함수, 역 라플라스 변환을 통하여 h(t) 함수를 구한다.
t = linspace(0,10,1000);

figure(4)
subplot(3,1,1)
plot(t,h(t),'-k','LineWidth',2);
grid on;
xlabel('t[sec]');
ylabel('h(t),system#1');
axis([0,10 ,-0.5, 1.5])

%-----------------------------------------------------------------------
sys2_zero = -5;
sys2_pole = [2j, -2j];

[b2 ,a2]= zp2tf(sys2_zero,sys2_pole,1);

pole_2 = [1 0 4];
zero_2 = [1 5];
[r,p,k] = residue(zero_2,pole_2);

syms  s

H3 = (0.5-1.25i)/(s-2i); %부분분수 전개
H4 = (0.5+1.25i)/(s+2i); % 부분분수 전개
H1 = H3+H4;
h1= matlabFunction(ilaplace(H1)); % ilapalace plot하기 위한 함수, 역 라플라스 변환을 통하여 h(t) 함수를 구한다.

subplot(3,1,2)
plot(t,h1(t),'-k','LineWidth',2);
grid on;
xlabel('t[sec]');
ylabel('h(t),system#2');
axis([0,10 ,-4, 4])



%-------------------------------------------------------
sys3_zero = -5;
sys3_pole = [1+2j, 1-2j];

[b3 ,a3]= zp2tf(sys3_zero,sys3_pole,1);

pole_3 = [1 -2 5];
zero_3 = [1 5];
[r,p,k] = residue(zero_3,pole_3);

syms  s

H3 = (0.5-1.5i)/(s-1-2i); %부분분수 전개
H4 = (0.5+1.5i)/(s-1+2i); % 부분분수 전개
H1 = H3+H4;
h1= matlabFunction(ilaplace(H1)); % ilapalace plot하기 위한 함수, 역 라플라스 변환을 통하여 h(t) 함수를 구한다.

subplot(3,1,3)
plot(t,h1(t),'-k','LineWidth',2);
grid on;
xlabel('t[sec]');
ylabel('h(t),system#3');
axis([0,10 ,-5*10^4, 10*10^4])


