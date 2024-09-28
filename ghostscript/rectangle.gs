%!PS
% Set up the page
<< /PageSize [400 400] >> setpagedevice

% Draw a red rectangle
newpath
100 100 moveto
300 100 lineto
300 300 lineto
100 300 lineto
closepath
1 0 0 setrgbcolor  % Red color
fill

% Draw a blue border around the rectangle
newpath
100 100 moveto
300 100 lineto
300 300 lineto
100 300 lineto
closepath
0 0 1 setrgbcolor  % Blue color
stroke

showpage

