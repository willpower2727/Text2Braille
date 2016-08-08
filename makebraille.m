function [imf,imb] = makebraille(dots)
%[imf,imb] = makebraille(dots) is a supporting function for txt2braille, given a set of
%dots it returns two images of the desired configuration, a forward and
%backward version. The forward is for a quality check, the backward is for
%someone actually trying to punch braille by hand. 
%
%   INPUT: must be list of integers 1-6
%   OUTPUT: 2 images (uint8)
%   i.e.
%
%   [imf,imb] = makebraille([1,2,5,6]); returns braille image of dots 1256
%   WDA 8/8/2016

if dots == 0
    imf = [];
    imb = [];
    return
end


f = figure('visible','off');%hide figure so it doesn't display during creation
% figure  %see each one
hold on
for z=1:length(dots)
   if dots(z) == 0
       continue %this will result in an incomplete set if zero is passed in with other dots
   elseif dots(z) == 1
       scatter(1,3,500,'MarkerFaceColor','black','MarkerEdgeColor','black')
   elseif dots(z) == 2
       scatter(1,2,500,'MarkerFaceColor','black','MarkerEdgeColor','black')
   elseif dots(z) == 3
       scatter(1,1,500,'MarkerFaceColor','black','MarkerEdgeColor','black')
   elseif dots(z) == 4
       scatter(1.5,3,500,'MarkerFaceColor','black','MarkerEdgeColor','black')
   elseif dots(z) == 5
       scatter(1.5,2,500,'MarkerFaceColor','black','MarkerEdgeColor','black')
   elseif dots(z) == 6
       scatter(1.5,1,500,'MarkerFaceColor','black','MarkerEdgeColor','black')
   else
       disp('ERROR: invalid dot requested...')
   end
end
ylim([0 4])
xlim([0.5 2])
pos = get(gcf,'pos');
set(gcf,'pos',[pos(1) pos(2) 200 300])
set(gca,'YTick',[]);
set(gca,'XTick',[]);
rectangle('position',[0.5 0 1.5 4],'edgecolor','k','LineWidth',2)

imf = frame2im(getframe(gca));%return the single braille as image
imb = fliplr(imf);
close all %close all figures to remove weird plotting afterwards
end

