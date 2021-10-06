function [t, p] = t_pulse(t1, t2, N, fs)
t = linspace(t1, t2, N+1); %시작시간 t1, 끝시간의최대값 t2 시간의범위
t = t(1:end-1); % 임펄스 전체길이 N, 표본화주파수 fs
p = zeros(1,N); % 제로 패딩으로 전체길이에 0을 전부 채워 준 다음에
p(1:round(N/((t2-t1)*fs)):end) = 1; % t1부터 매 Ts초마다 값이 나오게 함

%N+1 인자의 갯수