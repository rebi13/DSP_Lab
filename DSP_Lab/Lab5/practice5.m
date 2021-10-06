
clear; clc; 
X= myfun_LoadImage('lena.raw',256, 256);
% LoadImage 함수를 이용하여 이미지 불러오기
%--------------------------------------------
Z_OG=(1/256)*dct2(X); % 1 / 256 정규화 후 2차원 DCT
Z = (1/256)*dct2(X); % 1 / 256 정규화 후 2차원 DCT -> 이 값을 변화시킬 것임
Z_inv = uint8(256*idct2(Z_OG));
% 역으로 IDCT하고 unsigned 8 bits 정수로 Z_inv를 만들어준다.
th = [0.001, 0.01, 0.05, 0.1, 0.25, 0.5]; % 문턱값 계산을 위한 배열
RMSE = zeros(1,6); % RMSE 값을 담아주기 위하여 배열을 생성한다.
%---------------------------------------------
for i = 1:6
    Z(abs(Z) <= th(i)) = 0; % 문턱값에 의하여 압축
    Z_in(:,:,i) = uint8(256*idct2(Z)); % Z_in, Z_sub 라는 변수를 만들어서
    % 3차원 배열로 잡아준다. 마지막 인수는 th와 맞춰주기 위함이다.
    Z_sub(:,:,i) = (Z_inv - Z_in(:,:,i)).^2;
    RMSE(i) = sqrt(1/(256*256)*(sum(sum((Z_sub(:,:,i)))))); % RMSE 연산
end

figure(6)
plot (th,RMSE,'-ob')
xlabel('RMSE');
ylabel('Threshold');
grid on;
