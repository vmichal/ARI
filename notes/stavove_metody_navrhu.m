
%Zadán systém a žádané nové póly
A = [0 1 0; 0 -2 2; 0 0 -8]; B = [0;0;60];
s1 = -2+2i; s2 = -2-2i;s3 = -15;
c = (s-s1)*(s-s2)*(s-s3);


%matice soustavy a vstuvní v soustavì kanonické formy øiditelnosti
a = det(s*eye(3) - A);
Acon = [-a{2} -a{1} -a{0}; 1 0 0; 0 1 0];
a = det(s*eye(3)-Acon);
Bcon = [1;0;0];

%matice øiditelnosti v obou soustavách
C = ctrb(A,B);
Ccon = ctrb(Acon, Bcon);

%matice transformace souøadnic
V = C * inv(Ccon);

%easy výpoèet regulátoru
Kcon = c{2:-1:0} - a{2:-1:0};

%pøevedení regulátoru zpìt do obecných souøadnic
K = Kcon * inv(V);

%mìly by vyjít žádané polohy pólù
eig(A-B*K)

%ovìøení Ackermannem
Kack = acker(A, B, [s1 s2 s3]);
K  == Kack