
clc;
clear;

i = 0:15;
j = -5:5;

x1_1 = cos(2*pi*0.1*i);
x1_2 = i;
x1 = [x1_1 ; x1_2];

x2_1 = cos(2*pi*0.05*j);
x2_2 = j;
x2 = [x2_1 ; x2_2];

figure(3)
subplot(311);
stem(i,x1_1,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('x_1[n]');
grid on

subplot(312);
stem(j,x2_1,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('x_2[n]');
grid on

subplot(313);
[y, t] = myconv(x1,x2);
stem(t,y,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('y[n]');
grid on