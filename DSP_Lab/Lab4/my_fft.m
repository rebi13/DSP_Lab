function [f_hat,X_k,N_mult] = my_fft_js(x,N)
lognum=log2(N); % log2에 입력신호의 길이를 넣어 lognumber 생성,
f_hat = zeros(1,N); % 1부터 N까지 zero padding해서 f_hat에 저장 (변환된 신호를 담기 위한 그릇)
N_mult = 0; % 연산 횟수를 구하기 위한 변수
X_k = zeros(N,lognum+1); % N x lognumber 행렬만듬 (초기배열)
% 신호 길이 N이 2의 거듭제곱수 꼴이 아니면 여기서 오류가 난다.(lognum이 정수가 아니게 되서)
W = zeros(N/2,lognum); % 회전인자의 초기배열. 대칭성을 가져서 N/2만큼

%Setting the array
lognumber1=floor(log2(N)); % 배열 설정
f=zeros(N,lognumber1); % 배열
f(:,lognumber1)=transpose(0:N-1);  % f(:log) = 입력 신호 x[n]으로보면됨 
n = 0:N-1;
n_f = bin2dec(fliplr(dec2bin(n))); % 역비트순 구현
%10진수를 2진수로 변환 후 그걸 뒤집어서 다시 2진수를 10진수로 변환하면 역비트순을 구현할 수 있음

for k=1:N % FFT를 수행하기 위하여 역비트순을 한 것을 대입
    X_k(k,1)=x(n_f(k)+1); % 총 N개가 1열에 들어간다. x값을 각각 넣어줌
end

% 회전인자 생성
for n=1:lognum  
    temp=N/(2^(lognum-n)); % sample number n번째 
    for k=1:temp/2 % 단계에 따라서 곱해줄 회전인자를 각각 만들어줌. 
        W(k,n)=exp(-1j*2*pi/temp*(k-1)); % 1개, 2개, 4개 ...
    end
end

% 버터플라이 알고리즘 구현
for n=1:lognum  % 1단계, 2단계, ... , lognum단계로 진입시키기 위한 변수 n
    temp=N/(2^(lognum-n)); % n단계의 샘플 수(temp만큼 묶어서 샘플링).점차 증가함
    max=2^(lognum-n); % n번째 단계에서 진행하는 DFT연산의 횟수
    for j=1:max  % j값을 증가시켜서 값을 증가시킴.
        offset=(j-1)*temp;  % offset는 행의 위치를 지정한다. offset이 증가할수록 행의 시작 위치가 증가함.
        for k=1:temp/2 % k는 연산을 할 때 행의 시작 위치를 가리킨다. n단계에서 k는 2^(n-1)번 있음
            % k와 offset
            % offset+k 번째라면
            X_k(offset+k,n+1)=X_k(offset+k,n)+W(k,n)*X_k(offset+temp/2+k,n);
            % offset+k+temp/2 번째를 같이 구할 수 있다. (원점대칭하면 - 부호만 붙여주면 되기 때문)
            X_k(offset+temp/2+k,n+1)=X_k(offset+k,n)-W(k,n)*X_k(offset+temp/2+k,n);
            N_mult = N_mult+1;
        end
    end
end

for i = 0:N-1
    f_hat(i+1)= i/N;
end

% Plot
f_hat = f_hat -0.5; % -0.5만큼 평행 이동
X_k = X_k';
X1 = X_k(lognum+1 ,N/2+1:N);
X2 = X_k(lognum+1 ,1:N/2);
X_k(lognum+1,:) = [X1,X2];
