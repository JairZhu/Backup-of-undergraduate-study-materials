picture = imread('3.tif');
result = medianFilter('3.tif', 3);
subplot(1, 2, 1);
imshow(picture);
subplot(1, 2, 2);
imshow(result);