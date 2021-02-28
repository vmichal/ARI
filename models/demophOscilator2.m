% demophOscilator2: Van der Pol equation

% title
%tit('Van der Pol equation');

% initial conditions
setic([1,0;0,0.001;-1,-2;-2,3;2.5,1;1,-2]);

% axes limits
setax(7,7)

% functions: declare(f1,f2), where
% x1' = f1(x1,x2)
% x2' = f2(x1,x2)
declare('x2', '3*(1-x1.^2).*x2-x1')

% phase plot with time evolution
phase