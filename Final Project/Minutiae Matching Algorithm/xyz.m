%% Prepare the image for analysis
frameImg = imread('101_1.tif'); % read in coins image
templateImg = imread('101_2.tif'); % read in template image
%% display frame and template
figure, subplot(121),imshow(F),title('Gray Coins Image');
subplot(122),imshow(T),title('Coin Template');
%% correlation matching
[corrScore, boundingBox] = corrMatching(frameImg,templateImg);
%% show results
figure,imagesc(abs(corrScore)),axis image, axis off, colorbar, 
title('Corr Measurement Space')

bY = [boundingBox(1),boundingBox(1)+boundingBox(3),boundingBox(1)+boundingBox(3),boundingBox(1),boundingBox(1)];
bX = [boundingBox(2),boundingBox(2),boundingBox(2)+boundingBox(4),boundingBox(2)+boundingBox(4),boundingBox(2)];
figure,imshow(F),line(bX,bY),title('Detected Area');