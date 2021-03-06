function [] = txt2braille(txt)
%txt2braille
%   this function loads a braille key .mat file, then loops through every
%   character passed in and generates two images of the equivilant braille
%   text. The first image is the text directly converted to braille for a
%   quality check. The second image is a mirror view for hand-punching
%   braille (punching braille happens from the backside so it helps to have
%   the braille in reverse)
%
%   The txt input must be in string format
%
%   WDA 8/7/2016

load key.mat
key = braillekey.key;
braille = [0,0];

for z=1:length(txt)
%     unicode2native(txt(z));
    [~,~,ib] = intersect(unicode2native(txt(z)),key(:,1));
%     disp(key(ib,2:3))
    if ~isempty(ib)
        braille(z,:) = key(ib,2:3);
        charin(z) = key(ib,1);
    else
        braille(z,:) = [0,0];
        charin(z) = 0;
        disp('Warning: invalid character detected, removed from string');
    end
end

%generate braille images and splice together
finalf = [];
finalb = [];
for m = 1:length(braille)
    for n=1:2
%         dec2base(braille(m,n),10) - '0'
        [imf,imb] = makebraille(dec2base(braille(m,n),10) - '0',char(charin(m)));
        finalf = cat(2,finalf,imf);
        finalb = cat(2,imb,finalb);
        
    end
end

figure(1)
subplot(2,1,1)
imshow(finalf);
title('forwards');
subplot(2,1,2)
imshow(finalb);
title('backwards');

end

