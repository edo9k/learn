%!PS
% Set up the page
<< /PageSize [400 400] >> setpagedevice

% Draw a filled circle
newpath
200 200 50 0 360 arc  % Center (200, 200), radius 50
0 1 0 setrgbcolor  % Green color
fill

% Draw a black border around the circle
0 0 0 setrgbcolor  % Black color
stroke

showpage

