function [f0, X] = myfun_SA( t, x ) %
    N = length(x) ;
    fs = 1/(abs(t(2)-t(1))) ;
    X = fftshift(fft(x))/fs ;
    f = [0:N-1]/N ;
    f_0 = f(find(f<0.5)) ;
    f_1 = f(find(f>=0.5)) ;
    f0 = [f_1-1 f_0] * fs ;
    
    % 입??? : t?? x, t??? ???????? ????????? ????? ????????? ???????? ??????.
    % x??? ??? t?? ????? ????????????. t?? x??? ????????? ???????? ????????.
    % 출??? : f0?? X, f0??? ?????? [Hz], X??? x?? ????? ??????????????. f0??
    % X??? ????????? ???????? ?????? t?? ??????? ?????.
    
    % Y = fftshift(x) 는 제로 주파수 성분을 배열의 중심으로 이동하여
    % fft, fft2 및 fftn의 출력을 재배치한다.
    % 주파수 중간에 있는 제로 주파수 성분으로
    % 푸리에 변환을 시각화하는 데 유용하다.