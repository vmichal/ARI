clear s;
close all;
f = (s+1)/(s-1); %nestabiln� syst�m
%step(f); nestabiln� odezva
regulator = (s-1)/(s+2); %naivn� stabilizuj�c� regul�tor

dohromady = f * regulator; %rovnou se pokr�t�

%state = ss(dohromady) je BLB�, proto�e syst�m m� skryt� m�dy,
%kter� nejsou z p�enosu vid�t! CST by si myslel, �e m�me syst�m ��du 1,
%ale blo�ky jsou p�eci dva.

f_ss = ss(f);
regulator_ss = ss(regulator);

%seriov� zapojen� dvou syst�m�, d�v� spr�vn� popis odpov�daj�c� syst�mu ��du 2
dohromady_ss = series(regulator_ss, f_ss);

step(dohromady); %vykresl� odezvu na skok p�i nulov�ch po��te�n�ch podm�nk�ch
figure;
initial(dohromady_ss, [1 0]); %vykresl� odezvu na po�. podm�nky (nula na vstupu)
%tohle je ale v pohod�, proto�e syst�m je line�rn�, tak�e celkov� odpov��
%na step p�i nenulov�ch podm�nk�ch je sou�et step a initial

%Nenulov� PP vybudily skryt� nestabiln� stav a v�stup jde do nekone�na.

