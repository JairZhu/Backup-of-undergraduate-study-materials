close all;
clear all;

img = imread('lena.tif');
g = fft2(double(img));

g = fftshift(g);

imshow(abs(g),[])
[N1,N2] = size(g);
n = 2;
d0 = 30; 

n1 = fix(N1/2);
n2 = fix(N2/2);

result = g;
old = g;
count = 0;

while (true)
    count = count + 1;
    for i = 1:N1
      for j = 1:N2
          d = sqrt((i - n1)^2 + (j - n2)^2);
          h = 1 - exp(- d * d / (2 * d0 * d0));
          result(i,j) = h * result(i,j);
      end
    end
    fprintf('%d \n', count);
    if ischange(result, old)
        old = result;
    else
        break;
    end
    if mod(count, 50) == 0   
        result = ifftshift(result);
        X2=ifft2(result);
        final=uint8(real(X2));
        imshow(final);
    end
end