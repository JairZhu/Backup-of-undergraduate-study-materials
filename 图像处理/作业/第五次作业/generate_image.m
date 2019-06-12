for i = 1:250
    for j = 1:250
        R(i, j) = 0;
        G(i, j) = 1;
        B(i, j) = 0;
    end
end

for i = 1:250
    for j = 251:500
        R(i, j) = 1;
        G(i, j) = 0;
        B(i, j) = 0;
    end
end

for i = 251:500
    for j = 1:250
        R(i, j) = 0;
        G(i, j) = 0;
        B(i, j) = 1;
    end
end

for i = 251:500
    for j = 251:500
        R(i, j) = 0;
        G(i, j) = 1;
        B(i, j) = 0;
    end
end

for i = 1:500
    for  j = 1:500
        outimage(i, j, 1) = R(i, j);
        outimage(i, j, 2) = G(i, j);
        outimage(i, j, 3) = B(i, j);
    end
end

imshow(outimage);
imwrite(outimage, '6.25image.png');