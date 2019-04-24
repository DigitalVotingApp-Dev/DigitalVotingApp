load('db.mat');
%% EXTRACT FEATURES FROM AN ARBITRARY FINGERPRINT
I1= imread('101_1.tif');
figure;
imshow(I1)
glcm = graycomatrix(I1);
stats= graycoprops(glcm);
%da1=struct2array(stats);
m=struct2array(stats);
r=sum(m);
x=m/r;
mean=sum(x)/4;
SD=std(x);
anew=(x-mean)/SD;


%% FOR EACH FINGERPRINT TEMPLATE, CALCULATE MATCHING SCORE IN COMPARISION WITH FIRST ONE
S=zeros(80,1);
for i=1:80
    second=['10' num2str(fix((i-1)/8)+1) '_' num2str(mod(i-1,8)+1)];
    glcm = graycomatrix(second);
    stats= graycoprops(glcm);
    %da1=struct2array(stats);
    m=struct2array(stats);
    r=sum(m);
    x=m/r;
    mean=sum(x)/4;
    SD=std(x);
    a(:,i)=(x-mean)/SD;
    
    S(i)=sqrt(sum((anew-a(i)).^2,2));
 
   
    fprintf([num2str(S(i)) '\n']);
   
end
%% OFFER MATCHED FINGERPRINTS
Matched_FigerPrints=find(S>0.48)
