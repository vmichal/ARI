
g = (1-s+s^2)./(1+s)^4; %p�enos syst�mu

[A, B, C, D] = abcd(g); %ud�l�me si stavovou realizaci

%Jak zp�t na p�enos?
g_same1 = sdf(A, B, C, D); %Rovnou konstruktor Scalar Denominator Fraction

%Ru�n�, pro zaj�mavost si ov���me n�jak� z�klady
char_poly = det(s*eye(length(A)) - A); %sed� se jmenovatelem p�enosu g
% ko�eny charakteristick�ho polynomu jsou vlastn� ��sla A a to jsou p�ly syst�mu
vl_cisla = roots(char_poly); 
vl_cisla2 = eig(A); %TODO vych�z� tro�ku odli�n�, �ebek nev�, pro�

%inverze polynomi�ln� matice je racion�ln� matice.
inverze = inv(s*eye(length(A)) - A);
inverze2 = mdf(inv(s*eye(length(A)) - A)); %Matrix Denominator Fraction, p��m� konstruktor racion�ln� funkce pro matice

prenos = C * inverze * B + D; % a vy�el �pln� stejn� p�enos, z jak�ho jsme vy�li.
