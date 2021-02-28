%Ve startup.m se p�id�v� MAtlabu do cesty cesta k toolboxu
%t�m se automaticky definuj� p�smena s, z, d...

pinit; %inicializace toolboxu

%class(1+s); jm�no typu dan�ho objektu
%props(1+s); vyp�e member fieldy objektu

a = 1+s; b= 1-s;
c = a*b; %polynomy se spolu n�sob�, d�l�, s��taj� ...
f = c/a;  %typ je racion�ln� funkce, ne rovnou polynom rovn� b.
num_f = num(f); %obsahuje �itatel i jmenovatel
den_f = den(f);
equal_to_b = pol(num_f/den_f); %vynut� p�evod na polynom. Kdy� to nejde beze zbytku, funkce failne

vykraceno = f./a; %konstruuje racion�ln� funkci, ale rovnou kr�t� proti sob� ko�enov� �initele.


degree = 3;
a = prand(degree); % vygeneruje polynom s n�hodn�mi ko�eny dan�ho stupn�
%by default je to v 's', druh� (optional) argument bere prom�nnou
a = prand(degree, 's');
roots(a); %vektor ko�en�
isstable(a); % vrac� logickou hodnotu p�i spln�n� krit�ria stability (odli�n� pro spojit� a pro diskr�tn�)

a = prand(3); % Nech� a je polynom. Pak
degree = deg(a); %stupe� polynomu, analogicky degree = a.deg
leading_coef = lcoef(a); %koeficient u nevjvy��� mocniny
a_2 = a{2}; %polynom{i} vr�t� i-t� koeficient polynomu, tedy skal�r u s^i pro spojit�
coefs = a{1:3}; %vektor koeficient�

pformat; % defaultn� NICE, lze zvoli asi tucet mo�nost� form�tov�n� polynom�
pformat rootr; a; %nastav� v�pis polynomu faktorizovan�ho na ko�enov� �initele re�ln� (�i ireducibiln� kvad dvoj�len
pformat rootc; a; %nastav� v�pis polynomu faktorizovan�ho na ko�enov� �initele v�etn� komplexn�ch

E = prand(3,3,3); %stupen, vyska, sirka matice polynomi�ln�
E(1,1); %indexace matice 
E(1,:);

%Interakce s Control System Toolboxem (CST)

G_poly = prand(4)./prand(5);% vygenerujeme si n�jakou (pokr�cenou) ryz� rac fci, ta bude pro n�s p�enos.
G_cst = tf(G_poly); %objekt control system toolboxu p��mo z polynomial toolboxu.
%�asto jsou funkce (jako bode) overloadnuty i pro objekty polynomial toolboxu, ale je lep��
%vynutit konverzi na tf (to bude fungovat i pro p��pad v�ce p�enos�)
stav = ss(G_poly); %p�evod objektu polynomial toolboxu na state_space

[A, B, C, D] = abcd(G_poly); %rovnou n�m to do matic nacpe matice pro stavov� popis, funkce polynomial tbx

G_poly_same = sdf(stav);%p�evod CST -> polynomial. Rovnou vol�me konstruktor n�jak�ho objektu pro rac funkce.
%Typy racion�ln�ch funkc� se v�echny chovaj� stejn� pro skal�ry, li�� se tro�ku pro matice.

poldemo; %otev�e interaktivn� "n�pov�du", kter� �lov�ka provede mo�nostmi.

%Glob�ln� prom�nn�: lze zobrazit vol�n�m 
gprop %porad� i, jak� jsou p��pustn� hodnoty na nastaven�. Nastavuje se gprop hodnota
%(hodnoty nikdy nejsou p�i�aditeln� dv�ma glob�ln�m porm�nn�m, tak�e se neuv�d� jm�no prom�nn�)

%obsahuj� defaultn� prom�nnou pou��vanou pro polynomy (t�eba v prand), defaultn� je 's'
gprop z; %zm�n� defaultn� prom�nnou na z, prand generuje polynomy v z
%d�le verbosity level pro debugging, toleranci, jak "velk�" m��e b�t nula (co se ji� zanedb�v�)
%po�ad� zobrazov�n� �len� v polynomu. Lze zapnout automatick� redukov�n� zlomk� na nesoud�ln� �it a jm
%a automatickou konverzi zlomk� p�evoditeln�ch na polynom na polynom.
