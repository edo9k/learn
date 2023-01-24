%
% octave mandelbrot code from
% https://phenomenologica.com/index.php/blog/26-demos/36-making-fractals-with-octave
%


f = @(z, tau)(z^2 - tau);
n = 600;
its = 80;
tol=1.0e6;
colscale=128;
colormap(gray(colscale));

xmin=-1;
xmax=2.25;
ymin=-1.5;
ymax=-ymin;

deltax = xmax - xmin;
deltay = ymax - ymin;

X=zeros(n,n);

for k=1:n+1
  for l=1:n+1
    x=xmin+deltax*(k-1)/n;
    y=ymin+deltay*(l-1)/n;
  tau=x+j*y;
  z=f(0, tau);
  m=0;
  while norm(z)<tol && m<its
    z=f(z,tau);
    m=m+1;
  end
  if norm(z)>tol || isinf(z) || isnan(z)
    X(l,k)=round(colscale*m/its);
  end
end
end

image(X)

axis off

colormap('default');

print -djpg "./mandelbrot.jpg" 

