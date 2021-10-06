
clear; clc; 
X= myfun_LoadImage('lena.raw',256, 256);
% LoadImage �Լ��� �̿��Ͽ� �̹��� �ҷ�����
%--------------------------------------------
Z_OG=(1/256)*dct2(X); % 1 / 256 ����ȭ �� 2���� DCT
Z = (1/256)*dct2(X); % 1 / 256 ����ȭ �� 2���� DCT -> �� ���� ��ȭ��ų ����
Z_inv = uint8(256*idct2(Z_OG));
% ������ IDCT�ϰ� unsigned 8 bits ������ Z_inv�� ������ش�.
th = [0.001, 0.01, 0.05, 0.1, 0.25, 0.5]; % ���ΰ� ����� ���� �迭
RMSE = zeros(1,6); % RMSE ���� ����ֱ� ���Ͽ� �迭�� �����Ѵ�.
%---------------------------------------------
for i = 1:6
    Z(abs(Z) <= th(i)) = 0; % ���ΰ��� ���Ͽ� ����
    Z_in(:,:,i) = uint8(256*idct2(Z)); % Z_in, Z_sub ��� ������ ����
    % 3���� �迭�� ����ش�. ������ �μ��� th�� �����ֱ� �����̴�.
    Z_sub(:,:,i) = (Z_inv - Z_in(:,:,i)).^2;
    RMSE(i) = sqrt(1/(256*256)*(sum(sum((Z_sub(:,:,i)))))); % RMSE ����
end

figure(6)
plot (th,RMSE,'-ob')
xlabel('RMSE');
ylabel('Threshold');
grid on;