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

mol = min(min(r, g), b);
S = 1 - 3 .* mol ./ (r + g + b);

I = (r + g + b) / 3;

hsi = cat(3, H, S, I);

figure;
subplot(221); imshow(hsi); title('HSI');
subplot(222); imshow(H); title('H');
subplot(223); imshow(S); title('S');
subplot(224); imshow(I); title('I');