x = imread('../characters.tif');

subplot(321);
imshow(x);

subplot(322);
H = IPgaussian(10,512,512);
image = IPftfilter(x,H);
imshow(image);