clc; clear;

[y,fs] = audioread('Audio_Pop01_15sec.wav'); 
% 음성 파일을 읽어서 시간축 신호 y와 샘플링 주파수 fs 추출
t = linspace(0, 15, length(y));
% 0부터 15까지 신호의 길이만큼 잘라냄

figure(1)
subplot(2,1,1)
plot(t,y,'k'); % 샘플 오디오 신호
grid on;
xlabel('Time [sec]');
ylabel('Input audio, x(t)');
axis([0 15 -0.1 0.1])
[f,X] = myfun_SA(t,y); % 신호의 크기 스펙트럼
subplot(2,1,2)
plot(f,abs(X),'k');
grid on;
xlabel('Time [sec]');
ylabel('lX(f)l');
axis([0 5000 0 0.015])
sound(y,fs); % 음성 듣기


