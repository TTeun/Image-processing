image = imread('../trui.tif');

N = 8;
subplot(221)
imshow(image);

y = im2double(image);
m = min(min(y));
M = max(max(y));

y = y - m;
y = y ./ (M-m);
y = y .* (2^N);

image = uint8(255 * mat2gray(y));
subplot(222)
imshow(image);

subplot(223)
hist(image(:));

m1 = min(min(image));
M1 = max(max(image));