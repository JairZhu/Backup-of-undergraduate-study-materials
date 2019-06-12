function [change] = ischange(result1, result2)
    [row, col] = size(result1);
    for i = 1:row
        for j = 1:col
            if result1(i, j) ~= result2(i, j)
                change = true;
                return;
            end
        end
    end
    change = false;
end