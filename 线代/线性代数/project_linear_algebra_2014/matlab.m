% 导入图像
A=imread('D:\Documents\Pictures\Matlab.jpg');
% 灰度转换
B = rgb2gray(A);
subplot(1,2,1),subimage(A);
title('原图像');
subplot(1,2,2),subimage(B);
title('灰度转换')
figure;
%图像平移
tran = translate(strel(1), [100 100]);  
B = imdilate(A,tran); 
subplot(1,2,1),subimage(A);
title('原图像');
subplot(1,2,2),subimage(B);
title('图像平移')
figure;
%图像转置
B(:,:,1) = A(:,:,1)';
B(:,:,2) = A(:,:,2)';
B(:,:,3) = A(:,:,3)';
subplot(1,2,1),subimage(A);
title('原图像');
subplot(1,2,2),subimage(B);
title('图像转置')
figure;
%图像缩放
B=imresize(A,0.5);
subimage(A);
title('原图像');
figure, subimage(B);
title('缩放')
figure;
B= imrotate(A, 30, 'crop');
subplot(1,2,1),subimage(A);
title('原图像');
subplot(1,2,2),subimage(B);
title('旋转');
