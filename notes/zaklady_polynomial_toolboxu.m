%Ve startup.m se pøidává MAtlabu do cesty cesta k toolboxu
%tím se automaticky definují písmena s, z, d...

pinit; %inicializace toolboxu

%class(1+s); jméno typu daného objektu
%props(1+s); vypíše member fieldy objektu

a = 1+s; b= 1-s;
c = a*b; %polynomy se spolu násobí, dìlí, sèítají ...
f = c/a;  %typ je racionální funkce, ne rovnou polynom rovný b.
num_f = num(f); %obsahuje èitatel i jmenovatel
den_f = den(f);
equal_to_b = pol(num_f/den_f); %vynutí pøevod na polynom. Když to nejde beze zbytku, funkce failne

vykraceno = f./a; %konstruuje racionální funkci, ale rovnou krátí proti sobì koøenové èinitele.


degree = 3;
a = prand(degree); % vygeneruje polynom s náhodnými koøeny daného stupnì
%by default je to v 's', druhý (optional) argument bere promìnnou
a = prand(degree, 's');
roots(a); %vektor koøenù
isstable(a); % vrací logickou hodnotu pøi splnìní kritéria stability (odlišné pro spojité a pro diskrétní)

a = prand(3); % Nech a je polynom. Pak
degree = deg(a); %stupeò polynomu, analogicky degree = a.deg
leading_coef = lcoef(a); %koeficient u nevjvyšší mocniny
a_2 = a{2}; %polynom{i} vrátí i-tý koeficient polynomu, tedy skalár u s^i pro spojité
coefs = a{1:3}; %vektor koeficientù

pformat; % defaultnì NICE, lze zvoli asi tucet možností formátování polynomù
pformat rootr; a; %nastaví výpis polynomu faktorizovaného na koøenové èinitele reálné (èi ireducibilní kvad dvojèlen
pformat rootc; a; %nastaví výpis polynomu faktorizovaného na koøenové èinitele vèetnì komplexních

E = prand(3,3,3); %stupen, vyska, sirka matice polynomiální
E(1,1); %indexace matice 
E(1,:);

%Interakce s Control System Toolboxem (CST)

G_poly = prand(4)./prand(5);% vygenerujeme si nìjakou (pokrácenou) ryzí rac fci, ta bude pro nás pøenos.
G_cst = tf(G_poly); %objekt control system toolboxu pøímo z polynomial toolboxu.
%èasto jsou funkce (jako bode) overloadnuty i pro objekty polynomial toolboxu, ale je lepší
%vynutit konverzi na tf (to bude fungovat i pro pøípad více pøenosù)
stav = ss(G_poly); %pøevod objektu polynomial toolboxu na state_space

[A, B, C, D] = abcd(G_poly); %rovnou nám to do matic nacpe matice pro stavový popis, funkce polynomial tbx

G_poly_same = sdf(stav);%pøevod CST -> polynomial. Rovnou voláme konstruktor nìjakého objektu pro rac funkce.
%Typy racionálních funkcí se všechny chovají stejnì pro skaláry, liší se trošku pro matice.

poldemo; %otevøe interaktivní "nápovìdu", která èlovìka provede možnostmi.

%Globální promìnné: lze zobrazit voláním 
gprop %poradí i, jaké jsou pøípustné hodnoty na nastavení. Nastavuje se gprop hodnota
%(hodnoty nikdy nejsou pøiøaditelné dvìma globálním pormìnným, takže se neuvádí jméno promìnné)

%obsahují defaultní promìnnou používanou pro polynomy (tøeba v prand), defaultní je 's'
gprop z; %zmìní defaultní promìnnou na z, prand generuje polynomy v z
%dále verbosity level pro debugging, toleranci, jak "velká" mùže být nula (co se již zanedbává)
%poøadí zobrazování èlenù v polynomu. Lze zapnout automatické redukování zlomkù na nesoudìlný èit a jm
%a automatickou konverzi zlomkù pøevoditelných na polynom na polynom.
