rgb = imread('6.25image.png');
rgb = im2double(rgb);
r = rgb(:, :, 1);
g = rgb(:, :, 2);
b = rgb(:, :, 3);

mol = 0.5 * ((r - g) + (r - b));
den = sqrt((r - g) .^ 2 + (r - b) .* (g - b));
theta = acos(mol ./ (den));

if b > g
    H = 2 * pi - theta;
else
    H = theta;
end
H = H / (2 * pi);

n = 250;
temp(1:n, 1:n) = 1;
[h, w] = size(H);
x1 = double(H);
x2 = x1;
for i = 1:h
    for j = 1:w
        left = j - n / 2;
        right = j + n / 2;
        up = i - n / 2;
        down = i + n / 2;
        if left < 1
            left = 1;
        end
        if right > w
            right = w;
        end
        if up < 1
            up = 1;
        end
        if down > h
            down = h;
        end
        tmp = x1(up:down, left:right) .* temp(1:down - up + 1, 1:right - left + 1);
        summary = sum(sum(tmp));
        deno = sum(sum(temp(1:down - up + 1, 1:right - left + 1)));
        x2(i, j) = summary / deno;
    end
end
H = x2;
figure;
imshow(H); 
title('H');