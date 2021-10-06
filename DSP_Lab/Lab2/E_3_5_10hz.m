t1=-5;
t2=5;
N=4096;
fs=10;
tau = 20*pi;

[t, p] = pulse(t1, t2, N, fs);

xt = tau*sinc((tau*t)/(2*pi));
[f1,X2]=myfun_SA(t,xt);
yt = xt.*p;
[f2,X3]=myfun_SA(t,yt);

f=8 ; % 8차 버터워스필터 사용
[z, p0, k] = buttap(5) ;
[num, den] = zp2tf(z,p0,k) ;
[num, den] = lp2lp(num, den, 2*pi*f) ;
[num_d, den_d] = bilinear( num, den, 1/abs(t(2)-t(1)) ) ;
y_out = filter( num_d, den_d, yt) ;
[f3,X4] = myfun_SA(t,y_out);

figure(4);
subplot(221);
plot(t,yt);
axis([ -1 1 -20 80]);
xlabel('t[sec]');
ylabel('Before reconstruction y(t)');
grid on;

subplot(222);
plot(t,y_out);
axis([ -1 1 -1 3]);
xlabel('t[sec]');
ylabel('After reconstruction y(t)');
grid on;

subplot(223);
plot(f2,abs(X3));
axis([-30 30 0 0.4]);
xlabel('f[Hz]');
ylabel('Before reconstruction |Y(f)|');
grid on;

subplot(224);
plot(f3,abs(X4));
axis([-30 30 0 0.35]);
xlabel('f[Hz]');
ylabel('After reconstruction |Y(f)|');
grid on;