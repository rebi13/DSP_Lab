
[y1,fs1] = audioread('Audio_Classic01_11sec.wav'); 
[y2,fs2] = audioread('Audio_Piano01_10sec.wav'); 
[y3,fs3] = audioread('Audio_Song_Female01_10sec.wav'); 
[y4,fs4] = audioread('Audio_Voice_Female01_8sec.wav'); 
[y5,fs5] = audioread('Audio_Voice_male01_11sec.wav'); 
% 음성 파일을 읽어서 시간축 신호 y와 샘플링 주파수 fs 추출
t1 = linspace(0, 11, length(y1)); % Classic
t2 = linspace(0, 10, length(y2)); % Piano
t3 = linspace(0, 10, length(y3)); % Song_Female
t4 = linspace(0, 8, length(y4));  % Voice_Female
t5 = linspace(0, 11, length(y5)); % Voice_male

figure(1)
subplot(5,2,1)
plot(t1,y1,'k'); % 샘플 오디오 신호
grid on;
axis([0 11 -0.1 0.1])
ylabel('Classic')
[f1,X1] = myfun_SA(t1,y1); % 신호의 크기 스펙트럼
subplot(5,2,2)
plot(f1,abs(X1),'k');
grid on;
axis([0 5000 0 0.015])

subplot(5,2,3)
plot(t2,y2,'k'); % 샘플 오디오 신호
grid on;
axis([0 8 -0.1 0.1])
ylabel('Piano')
[f2,X2] = myfun_SA(t2,y2); % 신호의 크기 스펙트럼
subplot(5,2,4)
plot(f2,abs(X2),'k');
grid on;
axis([0 5000 0 0.015])

subplot(5,2,5)
plot(t3,y3,'k'); % 샘플 오디오 신호
grid on;
axis([0 8 -0.1 0.1])
ylabel('Song - Female')
[f3,X3] = myfun_SA(t3,y3); % 신호의 크기 스펙트럼
subplot(5,2,6)
plot(f3,abs(X3),'k');
grid on;
axis([0 5000 0 0.015])

subplot(5,2,7)
plot(t4,y4,'k'); % 샘플 오디오 신호
grid on;
axis([0 8 -0.1 0.1])
ylabel('Voice - Female')
[f4,X4] = myfun_SA(t4,y4); % 신호의 크기 스펙트럼
subplot(5,2,8)
plot(f4,abs(X4),'k');
grid on;
axis([0 5000 0 0.015])

subplot(5,2,9)
plot(t5,y5,'k'); % 샘플 오디오 신호
grid on;
axis([0 8 -0.1 0.1])
ylabel('Voice - male')
[f5,X5] = myfun_SA(t5,y5); % 신호의 크기 스펙트럼
subplot(5,2,10)
plot(f5,abs(X5),'k');
grid on;
axis([0 5000 0 0.015])
