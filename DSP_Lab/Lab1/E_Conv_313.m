
clc;
clear;
i = 0:15;

x1_1 = cos(2*pi*0.1*i);
x1_2 = i;
x1 = [x1_1 ; x1_2];

x2_2 = -5:5; % 단위임펄스함수 구현
x2_1 = x2_2 == 0; % 단위임펄스함수 구현
x2 = [x2_1 ; x2_2]; % 단위임펄스함수 구현

figure(2)
subplot(311);
stem(i,x1_1,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('x_1[n]');
grid on

subplot(312);
stem(x2(2,:),x2(1,:),'k','MarkerFaceColor','k');
xlabel('n');
ylabel('x_2[n]');
grid on

subplot(313);
[y, t] = myconv(x1,x2);
stem(t,y,'k','MarkerFaceColor','k');
xlabel('n');
ylabel('y[n]');
grid on