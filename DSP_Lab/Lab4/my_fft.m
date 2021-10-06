function [f_hat,X_k,N_mult] = my_fft_js(x,N)
lognum=log2(N); % log2�� �Է½�ȣ�� ���̸� �־� lognumber ����,
f_hat = zeros(1,N); % 1���� N���� zero padding�ؼ� f_hat�� ���� (��ȯ�� ��ȣ�� ��� ���� �׸�)
N_mult = 0; % ���� Ƚ���� ���ϱ� ���� ����
X_k = zeros(N,lognum+1); % N x lognumber ��ĸ��� (�ʱ�迭)
% ��ȣ ���� N�� 2�� �ŵ������� ���� �ƴϸ� ���⼭ ������ ����.(lognum�� ������ �ƴϰ� �Ǽ�)
W = zeros(N/2,lognum); % ȸ�������� �ʱ�迭. ��Ī���� ������ N/2��ŭ

%Setting the array
lognumber1=floor(log2(N)); % �迭 ����
f=zeros(N,lognumber1); % �迭
f(:,lognumber1)=transpose(0:N-1);  % f(:log) = �Է� ��ȣ x[n]���κ���� 
n = 0:N-1;
n_f = bin2dec(fliplr(dec2bin(n))); % ����Ʈ�� ����
%10������ 2������ ��ȯ �� �װ� ����� �ٽ� 2������ 10������ ��ȯ�ϸ� ����Ʈ���� ������ �� ����

for k=1:N % FFT�� �����ϱ� ���Ͽ� ����Ʈ���� �� ���� ����
    X_k(k,1)=x(n_f(k)+1); % �� N���� 1���� ����. x���� ���� �־���
end

% ȸ������ ����
for n=1:lognum  
    temp=N/(2^(lognum-n)); % sample number n��° 
    for k=1:temp/2 % �ܰ迡 ���� ������ ȸ�����ڸ� ���� �������. 
        W(k,n)=exp(-1j*2*pi/temp*(k-1)); % 1��, 2��, 4�� ...
    end
end

% �����ö��� �˰��� ����
for n=1:lognum  % 1�ܰ�, 2�ܰ�, ... , lognum�ܰ�� ���Խ�Ű�� ���� ���� n
    temp=N/(2^(lognum-n)); % n�ܰ��� ���� ��(temp��ŭ ��� ���ø�).���� ������
    max=2^(lognum-n); % n��° �ܰ迡�� �����ϴ� DFT������ Ƚ��
    for j=1:max  % j���� �������Ѽ� ���� ������Ŵ.
        offset=(j-1)*temp;  % offset�� ���� ��ġ�� �����Ѵ�. offset�� �����Ҽ��� ���� ���� ��ġ�� ������.
        for k=1:temp/2 % k�� ������ �� �� ���� ���� ��ġ�� ����Ų��. n�ܰ迡�� k�� 2^(n-1)�� ����
            % k�� offset
            % offset+k ��°���
            X_k(offset+k,n+1)=X_k(offset+k,n)+W(k,n)*X_k(offset+temp/2+k,n);
            % offset+k+temp/2 ��°�� ���� ���� �� �ִ�. (������Ī�ϸ� - ��ȣ�� �ٿ��ָ� �Ǳ� ����)
            X_k(offset+temp/2+k,n+1)=X_k(offset+k,n)-W(k,n)*X_k(offset+temp/2+k,n);
            N_mult = N_mult+1;
        end
    end
end

for i = 0:N-1
    f_hat(i+1)= i/N;
end

% Plot
f_hat = f_hat -0.5; % -0.5��ŭ ���� �̵�
X_k = X_k';
X1 = X_k(lognum+1 ,N/2+1:N);
X2 = X_k(lognum+1 ,1:N/2);
X_k(lognum+1,:) = [X1,X2];
