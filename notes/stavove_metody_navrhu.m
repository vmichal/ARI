
%Zad�n syst�m a ��dan� nov� p�ly
A = [0 1 0; 0 -2 2; 0 0 -8]; B = [0;0;60];
s1 = -2+2i; s2 = -2-2i;s3 = -15;
c = (s-s1)*(s-s2)*(s-s3);


%matice soustavy a vstuvn� v soustav� kanonick� formy �iditelnosti
a = det(s*eye(3) - A);
Acon = [-a{2} -a{1} -a{0}; 1 0 0; 0 1 0];
a = det(s*eye(3)-Acon);
Bcon = [1;0;0];

%matice �iditelnosti v obou soustav�ch
C = ctrb(A,B);
Ccon = ctrb(Acon, Bcon);

%matice transformace sou�adnic
V = C * inv(Ccon);

%easy v�po�et regul�toru
Kcon = c{2:-1:0} - a{2:-1:0};

%p�eveden� regul�toru zp�t do obecn�ch sou�adnic
K = Kcon * inv(V);

%m�ly by vyj�t ��dan� polohy p�l�
eig(A-B*K)

%ov��en� Ackermannem
Kack = acker(A, B, [s1 s2 s3]);
K  == Kack