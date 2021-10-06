
clear; clc; 
X= myfun_LoadImage('lena.raw',256, 256);
% LoadImage �Լ��� �̿��Ͽ� �̹��� �ҷ�����
Z_OG=(1/256)*dct2(X); % 1 / 256 ����ȭ �� 2���� DCT
Z = (1/256)*dct2(X); % 1 / 256 ����ȭ �� 2���� DCT -> �� ���� ��ȭ��ų ����
pix_num_OG = numel((Z_OG)); % Original ������ �ȼ��� ����
%---------------------------------------------
th = [0.001, 0.01, 0.05, 0.1, 0.25, 0.5]; % ���ΰ� ����� ���� �迭
pix_num = zeros(1,6); % pix_num ���� ����ֱ� ���Ͽ� �迭�� �����Ѵ�.
Ratio = zeros(1,6); % Ratio ���� ����ֱ� ���Ͽ� �迭�� �����Ѵ�.
for i = 1:6
    Z(abs(Z) <= th(i)) = 0; % ���ΰ��� ���Ͽ� ����
    pix_num(i) = numel(find(abs(Z))); % Z�� ���밪���� 0�� �ƴ� 
    % ����� ���Ҹ� ã�� �� ������ ���� pix_num(i)�� �����ϰ�
    Ratio(i) = pix_num(i)/pix_num_OG; % �⺻ �ȼ��� ������ ������.
end
figure(5);
semilogy(th,Ratio,'o-r'); % �α� Scale �׷����� �׷��ش�.
axis([0, 0.5, 10^-3, 10^0]);
xlabel('Threshold');
ylabel('Compression Ratio');
title('Compression Ratio');
grid on
