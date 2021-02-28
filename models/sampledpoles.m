function dtpoles=sampledpoles(ctpoles,sampling_period)
%%  caluates and plots poles of the sampled dt system from the poles of the original ct system
%   ctpoles - poles of the original ct system
%   dtpoles - poles of the resulting sampled system
%
%   Michael Sebek 2012
%%   


dtpoles = exp(-ctpoles.*sampling_period);
end
