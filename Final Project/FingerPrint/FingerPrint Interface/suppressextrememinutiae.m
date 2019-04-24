
% Once we defined the ROI, we can suppress minutiae external to this ROI.
[m,n]=size(I(:,:,1));
indTerm=sub2ind([m,n],CentroidTerm(:,1),CentroidTerm(:,2));
Z=zeros(m,n);
Z(indTerm)=1;
ZTerm=Z.*ROI';
[CentroidTermX,CentroidTermY]=find(ZTerm);

indBif=sub2ind([m,n],CentroidBif(:,1),CentroidBif(:,2));
Z=zeros(m,n);
Z(indBif)=1;
ZBif=Z.*ROI';
[CentroidBifX,CentroidBifY]=find(ZBif);



imshow(I)
hold on
plot(CentroidTermX,CentroidTermY,'ro','linewidth',2)
plot(CentroidBifX,CentroidBifY,'go','linewidth',2)


