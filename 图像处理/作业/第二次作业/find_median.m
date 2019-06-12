function [mid] = find_median(matrixA)
C = matrixA(:).';
mid = median(C);
end