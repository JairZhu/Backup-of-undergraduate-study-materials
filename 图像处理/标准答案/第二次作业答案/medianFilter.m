function [result] = medianFilter(pic, n)
    picture = imread(pic); %ͼƬ
    [row, col] = size(picture);
    result = zeros(row, col);
    step = int32((n - 1) / 2);
    for i = step + 1 : row - step
        for j = step + 1 : col - step
            t = picture(i-step:i+n-step-1,j-step:j+n-step-1);
            result(i, j) = median(t(:));
        end
    end
    result = uint8(result);
end