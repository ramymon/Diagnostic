a = menu('choisir la regle de decision','PLus proche centre de gravité','k plus proches voisions','Sortir');
switch a
    case 1
    %% Règle 1 :
Distance = kpv_distance(Data,mc);
[~,I] = sort(Distance,2);
ClassTest = I(:,1)';
ClassR = [ones(1,50),2*ones(1,50),3*ones(1,50)];
c  = ClassTest./ClassR;
Nbb=length(find(c==1)); 
disp('le nombre des echantillons associée à leur classe rèelle ')
disp(Nbb)
disp ('parmi 150')
    case 2
%% Règle 2 :
ClassR = [ones(1,50),2*ones(1,50),3*ones(1,50)];
k = input('Choisir k');
Distance = kpv_distance(Data,Data);
[~,I] = sort(Distance,2);
Index = I(:,2:k+1);
Pls = ones(N,k).*ClassR';

ClassTest = round(mean(Pls(Index),2))';
c  = ClassTest./ClassR;
Nbb=length(find(c==1)); 
disp('le nombre des echantillons associée à leur classe rèelle ')
disp(Nbb)
disp ('parmi 150')
end