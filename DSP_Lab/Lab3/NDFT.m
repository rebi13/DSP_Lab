
function [f_hat, X, N_mult] = NDFT(x)

N = length(x); % 원신호의 길이를 재서 N으로 저장
X = zeros(1, N); % 1부터 N까지 zero padding해서 X에 저장 (변환된 신호를 담기 위한 그릇)
N_mult = 0; % 연산 횟수를 저장하기 위한 변수
for k = 1:N 
    temp = zeros(1, N); % 시그마를 배열에 담고 한번에 더하기 위함.(신호를 담기위한 그릇을 만들어줌)
    for n = 1:N
        temp(n) = x(n) * exp(-1i * 2 * pi * (k - 1) * (n-1) / N); % 연산
        N_mult = N_mult + 1;
    end % temp를 미리 만들어놓음(시그마연산을 한번에 하기때문에 temp에 저장)
    X(k) = sum(temp); % k가 n일때 temp의 연산값을 전부 더해줌
end
f_hat = linspace(-0.5, 0.5 - 1 / N, N); % -0.5에서 0.5까지 N등분함
X = [X(f_hat >= 0) X(f_hat < 0)]; % 위의 0~0.5 구간인 부분 짤라서 왼쪽에다가 붙여줌 

%DFT는 오메가의 한 주기를 N개의 점으로 나누는 것이기 때문에 N이 매우 중요하다
%N-point DFT라 불리며, 시간영역의 신호 N개를 입력받아 주파수영역 신호 N개를 출력하는
%알고리즘이라 할 수 있다.