img = imread('rgb.png');
r = im2bw(img(:,:,1));
b = im2bw(img(:,:,3));
g = im2bw(img(:,:,2));
img2 = cat(3,r,g,b);
hsi = rgb2hsi(img2);
imshow(hsi(:,:,1))
imshow(hsi(:,:,2))
imshow(hsi(:,:,3))
imshow(hsi)