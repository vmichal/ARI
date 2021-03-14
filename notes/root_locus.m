
G = zpk([], [-1 -5], 5) %p�enosov� funkce bez nul, dva p�l v -1 a -5, zes�len� 5 (to ale nen� statick� zes�len�)

%vykreslen� root locus, hezk� obr�zek, ale ned� se nic m�nit. Jen vizualizace.
%rlocus(G);

%Otev�en� RL tool v r�mci control system desi
%rltool(G);

% Uvnit� RL tool je vid�t Step response mezi r�zn�mi sign�ly  ve smy�ce.
% Zaj�mav� je okno "root locus editor". Prav�m na volnou plochu grafu ->
% cesign requirements -> new
% V editoru lze p�etahovat polohu p�l� my��
% prav�m -> add pole zero

% Zrychlen� syst�mu se nejl�pe poda��, kdy� se v�echny t�i p�ly p�esunou
% nad sebe (zaji�t�no zrychlov�n�m nuly, kterou str��me n�kam vlevo od
% dominantn�ch p�l� open loopu). P�i dal��m zrychlov�n� posouv�me nulu v�c
% doprava, t�m ale jakoby posilujeme deriva�n� �len a mohou b�t velk�
% p�ekmity. �e�en�m je p�ihodit dal�� p�l na 10x v�t�� frekvenci ne� je
% nula, ten to odfiltruje.


%Control system -> export -> export tuned block

%NEstabiln� p�l
H = zpk([], [-1 5], 4)