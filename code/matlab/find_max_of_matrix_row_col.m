data = rand(5, 3);
[maxNum, maxIndex] = max(data(:));
[row, col] = ind2sub(size(data), maxIndex);