
imshow(I)
hold on
imshow(ROI)
alpha(0.5)

hold on
plot(CentroidTerm(:,1),CentroidTerm(:,2),'ro')
plot(CentroidBif(:,1),CentroidBif(:,2),'go')
hold off

