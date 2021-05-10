G = 1/s/(s+1); %spojitá soustava v OL pøenosu.
T = 2; %perioda vzorkování 0.5Hz, takže Nyquist skonèí na frekvenci 0.25 Hz (0.5 pi = 1.57 rad/s)
method = 'zoh'; %typ vzorkování

K = 1;
L = K*G; %diskrétní proporcionální reg

sys = c2d(tf(G), T, method);
zpk(sys);
nyquist(sys) %nyquist je celou dobu pod kritickým bodem, takže N = 0;
% ryze nestabilní póly soustava nemá, takže P = 0. Tudíž Z = 0 a CL bude stabilní

CL = L/(1+L);
isstable(CL) %returns true.