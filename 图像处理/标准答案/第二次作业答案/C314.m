rgb1 = imread('1.TIF');
h1 = fspecial('average',[3,3]);
rgb1_change = imfilter(rgb1,h1);

rgb2 = imread('2.TIF');
h1 = fspecial('average',[3,3]);
rgb2_change = imfilter(rgb2,h1);

%show
subplot(2, 4, 1);
imshow(rgb1);
subplot(2, 4, 5);
imhist(rgb1, 16);
subplot(2, 4, 3);
imshow(rgb2);
subplot(2, 4, 7);
imhist(rgb2, 16);

subplot(2, 4, 2);
imshow(rgb1_change);
subplot(2, 4, 6);
imhist(rgb1_change);

subplot(2, 4, 4);
imshow(rgb2_change);
subplot(2, 4, 8);
imhist(rgb2_change);