
G = zpk([], [-1 -5], 5) %pøenosová funkce bez nul, dva pól v -1 a -5, zesílení 5 (to ale není statické zesílení)

%vykreslení root locus, hezký obrázek, ale nedá se nic mìnit. Jen vizualizace.
%rlocus(G);

%Otevøení RL tool v rámci control system desi
%rltool(G);

% Uvnitø RL tool je vidìt Step response mezi rùznými signály  ve smyèce.
% Zajímavé je okno "root locus editor". Pravým na volnou plochu grafu ->
% cesign requirements -> new
% V editoru lze pøetahovat polohu pólù myší
% pravým -> add pole zero

% Zrychlení systému se nejlépe podaøí, když se všechny tøi póly pøesunou
% nad sebe (zajištìno zrychlováním nuly, kterou strèíme nìkam vlevo od
% dominantních pólù open loopu). Pøi dalším zrychlování posouváme nulu víc
% doprava, tím ale jakoby posilujeme derivaèní èlen a mohou být velké
% pøekmity. Øešením je pøihodit další pól na 10x vìtší frekvenci než je
% nula, ten to odfiltruje.


%Control system -> export -> export tuned block

%NEstabilní pól
H = zpk([], [-1 5], 4)