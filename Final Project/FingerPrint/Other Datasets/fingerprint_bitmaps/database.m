% BUILDING FINGERPRINT MINUTIAE DATABASE
%
% Usage:  build_db(ICount, JCount);
%
% Argument:   ICount -  Number of FingerPrints 
%             JCount -  Number of Images Per FingerPrint
%               

% Vahid. K. Alilou
% Department of Computer Engineering
% The University of Semnan
%
% July 2013

function database(ICount, JCount)
    p=0;
    for i=1:ICount
        for j=1:JCount
            filename=[ num2str(i) '_' num2str(48) '.bmp'];
            img = imread(filename); p=p+1;
            if ndims(img) == 3; img = rgb2gray(img); end   % colour image
            disp(['extracting features from ' filename ' ...']);
            ff{p}=ext_finger(img,1);
        end
    end
    save('db.mat','ff');
end