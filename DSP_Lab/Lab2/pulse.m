function [t, p] = pulse(t1, t2, N, fs)
n = 1; % n이라는 변수 지정 // 대충 t1=-5, t2=5
while fs * n < N / (t2 - t1) % 좌변이 우변보다 크면 while문 탈출
    n = n + 1; %좌변보다 우변이 한 틱만 큼. 최대한 t2에 근접하게 시간을 설정하고 싶어서 이렇게 함.
end  
time_origin = linspace(0, 1 - 1 / (fs * n), fs * n);% 타이밍맞추기 (0~1 100개면 101개라서 0.01씩 딱딱 맞춰서 안나옴) 그걸 맞추기 위한 함수. 
scale = floor(t2) + 1; % t2 값을 내림값. +1을 해서 스케일을 안정하게 해줌.
temp_1 = repmat(time_origin, 1, scale); %repmat 행렬을 복사붙여넣기해주는함수. 총 6개를 붙임
temp_p1 = zeros(1, length(time_origin)); % 값. p1을 1~100 까지 zero padding 함.
temp_p1(mod(time_origin, 1/fs) == 0) = 1; % ex 0~0.99까지 있다. 0.05를 기점으로 1이 생긴다고 하면 20개가 맞다. 
%이걸 제로패딩을 한 곳에 나머지가 0인 부분에다가 1을 대입해줌
temp_p2 = fliplr(temp_p1); %temp_p1을 뒤집음 (temp_p2를 만듬)
temp_p1 = repmat(temp_p1, 1, scale); % repmat 행렬을 복사붙여넣기. 총 6개를 붙임
for x = 1:scale %
    ind = length(time_origin) * x; %time_origin의 길이를 곱해서 위치를 구함. (위에서 repmat 행렬로 붙여넣기한 부분에 위치를 정해줌)
    temp_1(ind+1:end) = temp_1(ind+1:end) + 1; %구해진 temp_1의 위치(x축)에 1을 더해서 x축의 값을 만듬.
end                                            %가령 0~0.99가 맨처음의 temp_1인데, 이 위치에 1씩 계속 더해줌.

minus_origin = -1 + time_origin; % 이거는 -1부터 -0.01까지 해줌(뒤집음)

scale = abs(floor(t1)) + 1; %t1 값을 올림값. +1을 해서 스케일을 안정하게 해줌. ex 총 6개
temp_2 = repmat(minus_origin, 1, scale); % minus_origin을 6개 붙여줌 (행렬붙여주기)
temp_p2 = repmat(temp_p2, 1, scale); % fliplr 해준 것을 repmat 행렬로 붙여놓기 총 6개

for x = 1:scale 
    ind = length(time_origin) * x;
    temp_2(1:end-ind) = temp_2(1:end-ind) - 1; %얘는 반대로 가서 end에서 -ind 해준거
end
temp_2 = temp_2(temp_2 >= t1); %스케일로 좀 더 넣어준거를 t1부터 해서 짤라줌 이게 -x축의 길이
temp_1 = temp_1(1 : N - length(temp_2)); % 전체길이 N에 temp_2의 길이를 빼준 것을 temp_1로 정함 이게 +x축의 길이

temp_p1 = temp_p1(1:N - length(temp_2)); % p가 값임. 이 값을 또 넣어줌(+x축의 길이에 들어있는 값들)
temp_p2 = temp_p2(length(temp_p2) - length(temp_2) : end - 1); % temp_p2의 길이를 temp_2만큼 맞춰주고, 맨 끝에 1을 뺌(이게 중복되는 x=0인 구간)

t = [temp_2 temp_1]; % 결국에 t가 시간축이니까, -인 temp_2 구간과 +인 temp_1 구간을 합침
p = [temp_p2 temp_p1]; % 임펄스 열의 값을 -인 temp_p2 구간과 +인 temp_p2 구간을 합침