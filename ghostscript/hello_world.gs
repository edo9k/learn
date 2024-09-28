%!PS
% Set up the page
<< /PageSize [400 200] >> setpagedevice

% Set the font and size
/Helvetica findfont
24 scalefont
setfont

% Draw the first part of the text in red
1 0 0 setrgbcolor  % Red color
100 100 moveto
(Hello, ) show

% Draw the second part of the text in green
0 1 0 setrgbcolor  % Green color
200 100 moveto
(World!) show

% End the page
showpage

