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
    braille(z,:) = key(ib,2:3);
end

%generate braille images and splice together
for m = 1:length(braille)
    for n=1:2
        
        
        
    end
end


end
