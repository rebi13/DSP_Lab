

function [r1, r2] = myconv(x,y)
r1 = zeros(1, length(x) + length(y) - 1);
z_1 = [zeros(1, length(y) - 1) x(1, 1:end) zeros(1, length(y) - 1)];
z_2 = [fliplr(y(1, 1:end)) zeros(1, length(x) - 1) zeros(1, length(y) - 1)];

r2 = x(2,1) + y(2,1) : x(2,end) + y(2,end);

for a = 1:length(r1)
    r1(a) = sum(prod([z_1; z_2]));
    z_2 = circshift(z_2, 1, 2);
end
end

