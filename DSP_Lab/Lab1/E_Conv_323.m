%figure(1)

clc;
clear;

i = 0:15;
j = 0:5;
x_1 = cos(2*pi*0.1*i);
x_2 = i;

figure(1)
subplot(311)
stem(i,x_1,'k','MarkerFaceColor','k');
title('y[n] = x[n] * h[n]');
xlabel('n');
ylabel('x[n]');
grid on

h_1 = (0.5).^j;
h_2 = j;
subplot(312)
stem(j,h_1,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('h[n]');
grid on

x1 = [x_1 ; x_2];
h1 = [h_1 ; h_2];

[y, t] = myconv(x1,h1);
subplot(313)
stem(t,y,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('y[n]');
grid on

%figure(2)
figure(2)

i = 0:15;
j = 0:5;
x_1 = cos(2*pi*0.1*(i-5));
x_1 = [x_1(i <= 10) zeros(1,5)];
subplot(311)
stem(i,x_1,'r','MarkerFaceColor','r');
title('y[n - 5] = x[n - 5] * h[n]');
xlabel('n');
ylabel('x[n]');
grid on

h_1 = (0.5).^j;
h_2 = j;
subplot(312)
stem(j,h_1,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('h[n]');
grid on

x_2 = i;
x1 = [x_1 ; x_2];
h1 = [h_1 ; h_2];

[y, t] = myconv(x1,h1);
subplot(313)
stem(t,y,'r','MarkerFaceColor','r');
xlabel('n');
ylabel('y[n]');
grid on

