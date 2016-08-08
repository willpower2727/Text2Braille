function [imout] = makebraille(dots)
%makebraille() is a supporting function for txt2braille, given a set of
%dots it returns a single image of the desired configuration
%   i.e.
%
%   img = makebraille([1,2,5,6]); returns braille image of dots 1256

figure
hold on
for z=1:length(dots)
   if dots(z) == 1
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

imout = frame2im(getframe(gca));
close all

end

