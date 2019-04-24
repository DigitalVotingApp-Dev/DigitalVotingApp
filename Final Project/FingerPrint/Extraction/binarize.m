imshow(I)
figure
J=I(:,:,1)>160;
imshow(J)
set(gcf,'position',[1 1 600 600]);