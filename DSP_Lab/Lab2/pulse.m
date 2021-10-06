function [t, p] = pulse(t1, t2, N, fs)
n = 1; % n�̶�� ���� ���� // ���� t1=-5, t2=5
while fs * n < N / (t2 - t1) % �º��� �캯���� ũ�� while�� Ż��
    n = n + 1; %�º����� �캯�� �� ƽ�� ŭ. �ִ��� t2�� �����ϰ� �ð��� �����ϰ� �; �̷��� ��.
end  
time_origin = linspace(0, 1 - 1 / (fs * n), fs * n);% Ÿ�ָ̹��߱� (0~1 100���� 101���� 0.01�� ���� ���缭 �ȳ���) �װ� ���߱� ���� �Լ�. 
scale = floor(t2) + 1; % t2 ���� ������. +1�� �ؼ� �������� �����ϰ� ����.
temp_1 = repmat(time_origin, 1, scale); %repmat ����� ����ٿ��ֱ����ִ��Լ�. �� 6���� ����
temp_p1 = zeros(1, length(time_origin)); % ��. p1�� 1~100 ���� zero padding ��.
temp_p1(mod(time_origin, 1/fs) == 0) = 1; % ex 0~0.99���� �ִ�. 0.05�� �������� 1�� ����ٰ� �ϸ� 20���� �´�. 
%�̰� �����е��� �� ���� �������� 0�� �κп��ٰ� 1�� ��������
temp_p2 = fliplr(temp_p1); %temp_p1�� ������ (temp_p2�� ����)
temp_p1 = repmat(temp_p1, 1, scale); % repmat ����� ����ٿ��ֱ�. �� 6���� ����
for x = 1:scale %
    ind = length(time_origin) * x; %time_origin�� ���̸� ���ؼ� ��ġ�� ����. (������ repmat ��ķ� �ٿ��ֱ��� �κп� ��ġ�� ������)
    temp_1(ind+1:end) = temp_1(ind+1:end) + 1; %������ temp_1�� ��ġ(x��)�� 1�� ���ؼ� x���� ���� ����.
end                                            %���� 0~0.99�� ��ó���� temp_1�ε�, �� ��ġ�� 1�� ��� ������.

minus_origin = -1 + time_origin; % �̰Ŵ� -1���� -0.01���� ����(������)

scale = abs(floor(t1)) + 1; %t1 ���� �ø���. +1�� �ؼ� �������� �����ϰ� ����. ex �� 6��
temp_2 = repmat(minus_origin, 1, scale); % minus_origin�� 6�� �ٿ��� (��ĺٿ��ֱ�)
temp_p2 = repmat(temp_p2, 1, scale); % fliplr ���� ���� repmat ��ķ� �ٿ����� �� 6��

for x = 1:scale 
    ind = length(time_origin) * x;
    temp_2(1:end-ind) = temp_2(1:end-ind) - 1; %��� �ݴ�� ���� end���� -ind ���ذ�
end
temp_2 = temp_2(temp_2 >= t1); %�����Ϸ� �� �� �־��ذŸ� t1���� �ؼ� ©���� �̰� -x���� ����
temp_1 = temp_1(1 : N - length(temp_2)); % ��ü���� N�� temp_2�� ���̸� ���� ���� temp_1�� ���� �̰� +x���� ����

temp_p1 = temp_p1(1:N - length(temp_2)); % p�� ����. �� ���� �� �־���(+x���� ���̿� ����ִ� ����)
temp_p2 = temp_p2(length(temp_p2) - length(temp_2) : end - 1); % temp_p2�� ���̸� temp_2��ŭ �����ְ�, �� ���� 1�� ��(�̰� �ߺ��Ǵ� x=0�� ����)

t = [temp_2 temp_1]; % �ᱹ�� t�� �ð����̴ϱ�, -�� temp_2 ������ +�� temp_1 ������ ��ħ
p = [temp_p2 temp_p1]; % ���޽� ���� ���� -�� temp_p2 ������ +�� temp_p2 ������ ��ħ