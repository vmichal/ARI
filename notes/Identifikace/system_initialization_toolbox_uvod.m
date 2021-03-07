% Nahoøe vlevo: Import data->Time/Freq domain, tam se vyberou dva vektory z
% workspace pøedstavující èasovou osu a hodnoty. To natáhne data do system
% identification toolboxu.

% Uprostøed je "pracovní bod", kam se dotáhne signál a dají se s ním dìlat
% další operace. 

%Nejdøíve je potøeba odeèíst DC (Preproecss->Remove means)
% Když není vícero pokusù, ale jen jeden dlouho bìžící, lze si data rozdìlit
% vejpùl. Pomocí jedné poloviny estimovat a druhou validovat.
% Tyhle dva kroky lze provést najednou klikem na Preprocess->Quick start.

% Jednu polovinu (na estimaci) posuneme do pracovního bodu,
% druhou polovinu (na validaci) posuneme do validation data vpravo dole.

% Checkbox "Time plot" otevøe okno s èasovými prùbìhy

% Operations (uprostøed) -> Estimate... -> Transfer function model. 
% Vybere se poèet pólù a nul, oèekávaný group delay (dopravní zpoždìní) atp

% Chytnout výsledný model a pøetáhnout na "to workspace". To jej dostane do
% matlabu, kde je pro nìj speciální typ. Ten se bude pro další práci s CST
% nebo polynomial toolboxem muset pøevést nejdøív pomocí tf() a následnì
% tøeba na sdf (racionální funkce z polynomial toolboxu)

% Model output - èernì jsou data pro identifikaci (výstup pùvodního systému)
% Modøe je odezva výsledku identifikace. 
% U toho se vykresluje, jak dobrý je nalezený model fit. Když to nesedí
% dobøe, je potøeba složitìjší model (víc pólù èi nul).

% Pø: 1 pól a bez nul je pro fén match na 50%. 2 póly a jedna nula je 83% fit, 6 pólù+5nul je 92%

% Když mám data z mìøení, potøebuju je dostat do Matlab workspace. Následnì
% je natáhneme do system identification toolboxu a dál se s tím dá pracovat.