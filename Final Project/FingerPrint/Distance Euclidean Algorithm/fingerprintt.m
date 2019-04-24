clc;
I1= imread('101_1.tif');
figure;
imshow(I1)
J=adapthisteq(I1)
K=J(:,:,1)>160;
set(gcf,'position',[1 1 600 600]);
imshow(K);
glcm = graycomatrix(K);
stats= graycoprops(glcm);
m=struct2array(stats);
r=sum(m);
x=m/r;
mean=sum(x)/4;
SD=std(x);
a1=(x-mean)/SD;
    
I1= imread('101_7.tif');
figure;
imshow(I1)
J=adapthisteq(I1)
K=J(:,:,1)>160;
set(gcf,'position',[1 1 600 600]);
imshow(K);
glcm = graycomatrix(K);
stats= graycoprops(glcm);
%da1=struct2array(stats)
m=struct2array(stats);
r=sum(m);
x=m/r;
mean=sum(x)/4;
SD=std(x);
a2=(x-mean)/SD;
    
db1=sqrt(sum((a1-a2).^2,2));

if(db1>0.10)
    fprintf('\tDoes Not Match');
else
    fprintf('\tMatched');
end
fprintf('\n');
    
 









