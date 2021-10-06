
clc;
clear;
i = -5:5;

x1 = [0 0 0 0 0 1 1 1 0 0 0 ; i ];
x2 = [0 0 0 1 1 1 1 1 0 0 0 ; i ];

figure(1)
subplot(311)
stem(i,x1(1,:),'k','MarkerFaceColor','k');

xlabel('n');
ylabel('x_1[n]');
grid on

subplot(312)
stem(i,x2(1,:),'k','MarkerFaceColor','k');
xlabel('n');
ylabel('x_2[n]');
grid on

subplot(313)
[y, t] = myconv(x1,x2);
stem(t,y,'k','MarkerFaceColor','k');

xlabel('n');
ylabel('y[n]');
grid on