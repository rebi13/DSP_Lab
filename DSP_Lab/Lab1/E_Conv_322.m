clc;
clear;

i = 0:15;
j = -5:5;
k = 0:10;

x1_1 = cos(2*pi*0.1*i);
x1_2 = i;
x1 = [x1_1 ; x1_2];

x2_1 = cos(2*pi*0.05*j);
x2_2 = j;
x2 = [x2_1 ; x2_2];

x3_1 = (-1).^k;
x3_2 = k;
x3 = [x3_1 ; x3_2];

figure(5)
subplot(411)
stem(i,x1_1,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('x_1[n]');

subplot(412)
stem(j,x2_1,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('x_2[n]');

subplot(413)
stem(k,x3_1,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('x_3[n]');

subplot(414)
[y1_1,t1_1] = myconv(x1,x2);
a = [y1_1 ; t1_1];
[y2_1, t2_1] = myconv(a,x3);
stem(t2_1,y2_1,'MarkerFaceColor','k');
xlabel('n');
ylabel('y[n]');
grid on
hold on
subplot(414)
[y1_2,t1_2] = myconv(x2,x3);
b = [y1_2 ; t1_2];
[y2_2, t2_2] = myconv(x1,b);
stem(t2_2,y2_2,'-.r');
legend('{x1[n]*x2[n]}*x3[n]','x1[n]*{x2[n]*x3[n]}','location','northwest');

