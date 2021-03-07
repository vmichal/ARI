% Naho�e vlevo: Import data->Time/Freq domain, tam se vyberou dva vektory z
% workspace p�edstavuj�c� �asovou osu a hodnoty. To nat�hne data do system
% identification toolboxu.

% Uprost�ed je "pracovn� bod", kam se dot�hne sign�l a daj� se s n�m d�lat
% dal�� operace. 

%Nejd��ve je pot�eba ode��st DC (Preproecss->Remove means)
% Kdy� nen� v�cero pokus�, ale jen jeden dlouho b��c�, lze si data rozd�lit
% vejp�l. Pomoc� jedn� poloviny estimovat a druhou validovat.
% Tyhle dva kroky lze prov�st najednou klikem na Preprocess->Quick start.

% Jednu polovinu (na estimaci) posuneme do pracovn�ho bodu,
% druhou polovinu (na validaci) posuneme do validation data vpravo dole.

% Checkbox "Time plot" otev�e okno s �asov�mi pr�b�hy

% Operations (uprost�ed) -> Estimate... -> Transfer function model. 
% Vybere se po�et p�l� a nul, o�ek�van� group delay (dopravn� zpo�d�n�) atp

% Chytnout v�sledn� model a p�et�hnout na "to workspace". To jej dostane do
% matlabu, kde je pro n�j speci�ln� typ. Ten se bude pro dal�� pr�ci s CST
% nebo polynomial toolboxem muset p�ev�st nejd��v pomoc� tf() a n�sledn�
% t�eba na sdf (racion�ln� funkce z polynomial toolboxu)

% Model output - �ern� jsou data pro identifikaci (v�stup p�vodn�ho syst�mu)
% Mod�e je odezva v�sledku identifikace. 
% U toho se vykresluje, jak dobr� je nalezen� model fit. Kdy� to nesed�
% dob�e, je pot�eba slo�it�j�� model (v�c p�l� �i nul).

% P�: 1 p�l a bez nul je pro f�n match na 50%. 2 p�ly a jedna nula je 83% fit, 6 p�l�+5nul je 92%

% Kdy� m�m data z m��en�, pot�ebuju je dostat do Matlab workspace. N�sledn�
% je nat�hneme do system identification toolboxu a d�l se s t�m d� pracovat.