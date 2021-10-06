
clc;
clear;

t1 = -5;
t2 = 5;
fs = 15;
N = 4096;
tau = 20*pi;
[t, p] = pulse(t1, t2, N, fs);

figure(2);
subplot(321);
plot(t,p);
axis([-1 1 0 1.2]);
xlabel('t[sec]');
ylabel('p(t)');
grid on;

[f0,X1]=myfun_SA(t,p);
subplot(322);
plot(f0,abs(X1));
axis([-30 30 0 0.5]);
xlabel('f[Hz]');
ylabel('|P(f)|');
grid on;

xt = tau*sinc((tau*t)/(2*pi));
subplot(323);
plot(t,xt);
axis([ -1 1 -20 80]);
xlabel('t[sec]');
ylabel('x(t)');
grid on; 

[f1,X2]=myfun_SA(t,xt);
subplot(324);
plot(f1,abs(X2));
axis([ -30 30 0 8]);
xlabel('f[Hz]');
ylabel('|X(f)|');
grid on;

yt = xt.*p;
subplot(325);
plot(t,yt);
axis([-1 1 -20 80]);
xlabel('t[sec]');
ylabel('y(t)');
grid on;

[f2,X3] = myfun_SA(t,yt);
subplot(326);
plot(f2,abs(X3));
axis([-30 30 0 0.35]);
xlabel('f[Hz]');
ylabel('|Y(f)|');
grid on;