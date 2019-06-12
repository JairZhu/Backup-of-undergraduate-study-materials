rgb1=imread('rgb.png');
r = im2bw(rgb1(:,:,1));
b = im2bw(rgb1(:,:,3));
g = im2bw(rgb1(:,:,2));
img2 = cat(3,r,g,b);
h=rgb2hsi(img2);
H=h(:,:,1);%色度分量
S=h(:,:,2);%饱和度分量
I=h(:,:,3);%亮度分量
w=fspecial('average',250);%250*250平滑算子
%S_filtered=imfilter(S,w,'replicat');
%S1=cat(3,H,S_filtered,I);

H_filtered=imfilter(H,w,'replicat');
H1=cat(3,H_filtered,S,I);

f=hsi2rgb(H1);
f=min(f,1);
figure,imshow(f)
