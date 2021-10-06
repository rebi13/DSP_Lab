clear; clc; 

sys1_zero = -5;
sys1_pole = [0.5*exp(-1i*(pi/4)), 0.5*exp(1i*(pi/4))];

[b1 ,a1]= zp2tf(sys1_zero,sys1_pole,1);

[r,p,k] = residue(b1,a1);

syms  z n 
H1 = (0.5-7.5710i)/(z-0.3535-0.3536i); %부분분수 전개
H2 = (0.5+7.5710i)/(z-0.3535+0.3536i); % 부분분수 전개
H = H1+H2;
h=iztrans(H,z,n) ;% Z역변환을 통해 충격응답 함수를 구한다.
n1 = 0:20;
h = real(double(subs(h,n,n1)));


figure(8)
subplot(3,1,1)
stem(n1,h,'-k','filled');
grid on;
xlabel('n');
ylabel('h(n),system#1');
axis([0,20,-2 ,6]); 
%----------------------------------------------------
sys1_zero = -5;
sys1_pole = [exp(-1i*(pi/4)),exp(1i*(pi/4))];

[b2 ,a2]= zp2tf(sys1_zero,sys1_pole,1)

pole_1 = [1 -1.4142 1];
zero_1 = [1 5];
[r,p,k] = residue(zero_1,pole_1)

syms  z n 
H1 = (0.5-4.0355i)/(z-0.7071-0.7071i); %부분분수 전개
H2 = (0.5+4.0355i)/(z-0.7071+0.7071i); % 부분분수 전개
H = H1+H2;
h=iztrans(H,z,n) ;%% Z역변환을 통해 충격응답 함수를 구한다.
n1 = 0:20;
h = real(double(subs(h,n,n1)));

subplot(3,1,2)
stem(n1,h,'-k','filled');
grid on;
xlabel('n');
ylabel('h(n),system#2');
axis([0,20,-10 ,10]); 
%----------------------------------------------------
sys1_zero = -5;
sys1_pole = [1.5*exp(-1i*(pi/4)),1.5*exp(1i*(pi/4))];

[b3 ,a3]= zp2tf(sys1_zero,sys1_pole,1)

pole_1 = [1 -2.1213 2.25];
zero_1 = [1 5];
[r,p,k] = residue(zero_1,pole_1)

syms  z n 
H1 = (0.5-2.8570i)/(z-1.0607-1.0607i); %부분분수 전개
H2 = (0.5+2.8570i)/(z-1.0607+1.0607i); % 부분분수 전개
H = H1+H2;
h=iztrans(H,z,n) %% Z역변환을 통해 충격응답 함수를 구한다.
n1 = 0:20;
h = real(double(subs(h,n,n1)));

subplot(3,1,3)
stem(n1,h,'-k','filled');
grid on;
xlabel('n');
ylabel('h(n),system#3');
axis([0,20,-5*10^3 ,10^4]); 