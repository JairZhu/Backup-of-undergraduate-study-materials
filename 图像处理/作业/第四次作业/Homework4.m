close all;
clear all;
img = imread('lena.tif');

count = 0;
while (true)
    count = count + 1;
    g = fft2(img);
    g = fftshift(g);
    result = g

%     imshow(abs(g),[])
    [N1,N2] = size(g);
    n = 2;
    d0 = 30; 

    n1 = fix(N1/2);
    n2 = fix(N2/2);

    for i = 1:N1
      for j = 1:N2
          d = sqrt((i - n1)^2 + (j - n2)^2);
          h = 1 - exp(- d * d / (2 * d0 * d0));
          result(i,j) = h * result(i,j);
      end
    end
    result = ifftshift(result);
    img2 = ifft2(res);
    img2 = uint8(real(img2));
    
    imshow(img2);
    fprintf('%d \n', count);
    if isequal(img2, img)
         break;
    else
        old = result;
    end
    img = img2;
%     if mod(count, 200) == 0   
%         % fft是一维傅里叶变换，即将时域信号转换为频域信号
%         % fftshift是针对频域的，将FFT的DC分量移到频谱中心
%         % 即对频域的图像，（假设用一条水平线和一条垂直线将频谱图分成四块）对这四块进行对角线的交换与反对角线的交换
%         % ifft means the inverse of fft.
%         % get the initial result of image.
%         result = ifftshift(result);
%         X2=ifft2(result);
%         final=uint8(real(X2));
%         imshow(final);
%     end
end