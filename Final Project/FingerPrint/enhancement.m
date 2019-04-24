I = imread('101_1.tif');
figure,imshow(I)
I1 = rgb2gray(I);
figure,imshow(I1)
gA=imadjust(I1,[.01 .6],[0 1]);
figure, imshow(gA);