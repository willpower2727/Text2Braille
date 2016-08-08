% Create a logical image of a circle with specified
% diameter, center, and image size.
% First create the image.
imageSizeX = 100;
imageSizeY = 50;
[columnsInImage rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
% Next create the circle in the image.
centerX = imageSizeX/2;
centerY = imageSizeY/2;
radius = 25;
circlePixels = (rowsInImage - centerY).^2 ...
    + (columnsInImage - centerX).^2 <= radius.^2;
% circlePixels is a 2D "logical" array.
% Now, display it.
image(circlePixels) ;
colormap([1 1 1; 0 0 0]);
title('Binary image of a circle');