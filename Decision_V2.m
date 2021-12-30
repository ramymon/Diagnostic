DataT = Select_Data('Choisir Un jeux de données pour le traiter','*.mat');
[N1,d] = size(DataT); % N1 est le nombre d'echanttillon , d est le nombre des paramètre de depart
% ----- Centrage et reduction du jeu de donnees si necessaire ------%
DataT = (DataT-ones(N1,1)*mean(DataT))./(ones(N1,1)*std(DataT));

Data_New = [];
for i = 1 : M  
            index=find(Class==i);
           Data_New  = [Data_New;Data(index,:)];
end

%%
a = menu('choisir la regle de decision','PLus proche centre de gravité','k plus proches voisions','Sortir');
switch a
    case 1
    %% Règle 1 :
Distance = kpv_distance(DataT,mc);
[~,I] = sort(Distance,2);
ClassTest = I(:,1)';
ClassR = [ones(1,25),2*ones(1,25),3*ones(1,25)];
c  = ClassTest./ClassR;
Nbb1=length(find(c(1:25)==1)); 
Nbb2=length(find(c(26:50)==1)); 
Nbb3=length(find(c(51:75)==1)); 
Nbb = length(find(c==1)); 

Npc= [Nbb1 Nbb2 Nbb3];
disp(Npc/25);

disp('le nombre des echantillons associée à leur classe rèelle ')
disp(Nbb)
disp ('parmi 75')
disp((100*Nbb)/75)
    case 2
%% Règle 2 :
ClassR = [ones(1,25),2*ones(1,25),3*ones(1,25)];
k = input('Choisir k');
Distance = kpv_distance(DataT,Data_New);
[~,I] = sort(Distance,2);
Index = I(:,1:k);
Pls = ones(N,k).*ClassR';
ClassTest = round(mean(Pls(Index),2))';

c  = ClassTest./ClassR;
Nbb1=length(find(c(1:25)==1)); 
Nbb2=length(find(c(26:50)==1)); 
Nbb3=length(find(c(51:75)==1)); 
Nbb = length(find(c==1)); 
Npc= [Nbb1 Nbb2 Nbb3];
disp(Npc/25);


disp('le nombre des echantillons associée à leur classe rèelle ')
disp(Nbb)
disp ('parmi 75')
disp((100*Nbb)/75)
end
figure (4)
ACPN_L;
ACPN_Test;
  legend(' Classe 1','Classe 2','Classe 3','Classe 1 test ','Classe 2 test','Classe 3 test')