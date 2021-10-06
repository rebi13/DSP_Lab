
clc;
clear;

i = -5:5;
j = 0:5;

x1_1 = cos(2*pi*0.05*i);
x1_2 = i;
x2_1 = 1:6;
x2_2 = j;

x1 = [x1_1 ; x1_2];
x2 = [x2_1 ; x2_2];

figure(4)
subplot(311)
stem(i,x1_1,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('x_1[n]');
grid on

subplot(312)
stem(x2(2,:),x2(1,:),'k','MarkerFaceColor','k');
xlabel('n');
ylabel('x_2[n]');
grid on

subplot(313)
[y1, t1] = myconv(x1,x2);
stem(t1,y1,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('y[n]');
grid on
hold on
[y2, t2] = myconv(x2,x1);
stem(t2,y2,'-.r');
legend('x1[n]*x2[n]','x2[n]*x1[n]','location','northwest');
