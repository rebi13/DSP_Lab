clear;
clc;

N=3;
N_mult = 0;
x=[100 200 200; 20 100 200; 20 20 100];
X=zeros(N,N);


for k1=1:N
    for k2=1:N
        for n1=0:N-1
            for n2=0:N-1
                X(k1,k2)=X(k1,k2) + x(n1+1,n2+1)*exp(-1j*2*pi*((n1*k1)/N))*exp(-1j*2*pi*((n2*k2)/N));
                N_mult = N_mult + 1;
            end
        end
    end
end
abs(X)

