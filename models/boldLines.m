function f=boldLines(functionName,transferFunction,LineWidth)
%%  function boldLines
%   version 1.1
%%   Example:
% %   boldLines('bode',sys,3)
feval(str2func(functionName),transferFunction);
h = findobj(gcf,'type','line');
set(h,'linewidth',LineWidth);
end
