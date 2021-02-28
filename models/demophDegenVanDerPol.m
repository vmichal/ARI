% demo 5: phase portrait of Degenerate Van der Pol oscillator

% title
%tit('Degenerate Van der pol Oscillator');

%parameter
epsilon=0.1

% initial conditions
setic([0,0;.001,.001;-.001,.001])
   
% axes limits
setax(1,1.5)

% functions: declare(f1,f2), where
% x1' = f1(x1,x2)
% x2' = f2(x1,x2)
%declare('1.\(-x2-x1.*(x1.^2-1))', '1.\x1')
declare('x2','-epsilon\(x1-x2+x2.^3)')

% phase plot with time evolution
phase