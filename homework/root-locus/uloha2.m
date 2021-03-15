
sys = hw_4_std(18,2,00);

%rltool(sys);

rlocus(LoopTransfer_C);

CLr2y = IOTransfer_r2y;
step(CLr2y);
title('Step response of closed loop');

step(reference2error);
title('Step response of closed loop');