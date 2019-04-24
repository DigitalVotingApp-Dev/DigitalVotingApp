clc
function build_db(ICount, JCount)
    p=0;
    for i=1:ICount
        for j=1:JCount
            filename=[ num2str(i) '_' num2str(j) '.bmp'];
            img = imread(filename); p=p+1;
            if ndims(img) == 3; img = rgb2gray(img); end   % colour image
            disp(['extracting features from ' filename ' ...']);
            ff{p}=suppressminutiae(img,1);
        end
    end
    save('db.mat','ff');
end