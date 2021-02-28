clear s;
close all;
f = (s+1)/(s-1); %nestabilní systém
%step(f); nestabilní odezva
regulator = (s-1)/(s+2); %naivní stabilizující regulátor

dohromady = f * regulator; %rovnou se pokrátí

%state = ss(dohromady) je BLBÌ, protože systém má skryté módy,
%které nejsou z pøenosu vidìt! CST by si myslel, že máme systém øádu 1,
%ale bloèky jsou pøeci dva.

f_ss = ss(f);
regulator_ss = ss(regulator);

%seriové zapojení dvou systémù, dává správný popis odpovídající systému øádu 2
dohromady_ss = series(regulator_ss, f_ss);

step(dohromady); %vykreslí odezvu na skok pøi nulových poèíteèních podmínkách
figure;
initial(dohromady_ss, [1 0]); %vykreslí odezvu na poè. podmínky (nula na vstupu)
%tohle je ale v pohodì, protože systém je lineární, takže celková odpovìï
%na step pøi nenulových podmínkách je souèet step a initial

%Nenulové PP vybudily skrytý nestabilní stav a výstup jde do nekoneèna.

