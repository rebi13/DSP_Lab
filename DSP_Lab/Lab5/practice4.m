
clear; clc; 
X= myfun_LoadImage('lena.raw',256, 256);
% LoadImage 함수를 이용하여 이미지 불러오기
Z_OG=(1/256)*dct2(X); % 1 / 256 정규화 후 2차원 DCT
Z = (1/256)*dct2(X); % 1 / 256 정규화 후 2차원 DCT -> 이 값을 변화시킬 것임
pix_num_OG = numel((Z_OG)); % Original 사진의 픽셀값 개수
%---------------------------------------------
th = [0.001, 0.01, 0.05, 0.1, 0.25, 0.5]; % 문턱값 계산을 위한 배열
pix_num = zeros(1,6); % pix_num 값을 담아주기 위하여 배열을 생성한다.
Ratio = zeros(1,6); % Ratio 값을 담아주기 위하여 배열을 생성한다.
for i = 1:6
    Z(abs(Z) <= th(i)) = 0; % 문턱값에 의하여 압축
    pix_num(i) = numel(find(abs(Z))); % Z의 절대값에서 0이 아닌 
    % 행렬의 원소를 찾아 그 개수를 세어 pix_num(i)에 저장하고
    Ratio(i) = pix_num(i)/pix_num_OG; % 기본 픽셀값 개수를 나눈다.
end
figure(5);
semilogy(th,Ratio,'o-r'); % 로그 Scale 그래프를 그려준다.
axis([0, 0.5, 10^-3, 10^0]);
xlabel('Threshold');
ylabel('Compression Ratio');
title('Compression Ratio');
grid on
