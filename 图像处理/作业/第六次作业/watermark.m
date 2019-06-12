alpha = 1;
% 读取图片
image = double(imread('test.jpg')) / 255;
water_mark = double(imread('mark.jpg')) / 255;

% 编码水印
image_size = size(image);
tsymmetric = zeros(image_size(1) * 0.5, image_size(2), image_size(3));
tsymmetric1 = tsymmetric;
tsymmetric1(1:size(water_mark, 1), 1:size(water_mark, 2), :) = water_mark;
% 采用随机序列编码
m = randperm(0.5 * image_size(1));
n = randperm(image_size(2));
for i = 1:image_size(1) * 0.5
    for j = 1:image_size(2)
        tsymmetric(i, j, :) = tsymmetric1(m(i), n(j), :);
    end
end
encoded_mark = zeros(image_size(1), image_size(2), image_size(3));
encoded_mark(1:image_size(1) * 0.5, 1:image_size(2), :) = tsymmetric;
for i = 1:image_size(1) * 0.5
    for j = 1:image_size(2)
        encoded_mark(image_size(1) + 1 - i, image_size(2) + 1 - j, :) = tsymmetric(i, j, :);
    end
end

% 将编码后的水印加入图片
fimage = fft2(image);
fwater_image = fimage + alpha * double(encoded_mark);
output = ifft2(fwater_image);

% 从图中提取出水印
fout = fft2(output);
gwatermark = (fout - fimage) / alpha;
out_water_mark = gwatermark;
for i = 1:image_size(1) * 0.5
    for j = 1:image_size(2)
        out_water_mark(m(i), n(j), :) = gwatermark(i, j, :);
    end
end
for i = 1:image_size(1) * 0.5
    for j = 1:image_size(2)
        out_water_mark(image_size(1) + 1 - i, image_size(2) + 1 - j, :) = out_water_mark(i, j, :);
    end
end

% 绘制图像
subplot(221); imshow(image); title('原图');
subplot(222); imshow(water_mark); title('水印');
subplot(223); imshow(output); title('加入水印的图像');
subplot(224); imshow(out_water_mark); title('提取出的水印');