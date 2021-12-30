%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Indiquer le nombre M de classes cherch�es (k=1�M)
% Initialiser au hasard les centres de gravit� des M classes
% R�p�ter
% q=q+1
% Associer � une m�me classe les �chantillons les plus proches
% (au sens de la distance entre un �chantillon et le centre de chaque classe)
% Calculer le nouveau centre de gravit� obtenu dans chaque classe
% Calculer crit�re_distance(q)
% Crit�re_arr�t= crit�re_distance(q)- crit�re_distance(q-1)
% Tant que crit�re_arr�t > 10-3
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

%% Initialisation :
[N,d] = size(Data); % N: nombre des �chantillions, d: nombres des param�tres
e= 0.001; % erreur tol�r�e.
q=0; %nombre d'iterations (initial)
Nb= zeros(1,M); % Nombre de points par classe
J = 100;
%% choix des centres de gravit� initials
a = menu('choisir la methode d''initialtion','Aleatoire','Expert','Sortir');
switch a
    case 1
    % Aleatoire : 
alea = randperm(N,M);  mc = Data(alea,:);
    case 2
% Expert :
a =  round(linspace(1,N,M)); 
mc = Data(a,:); % Centres de gravit� appartiennent au jeu des donn�es
end
%% Association des �chantillons les plus proches d'un CG � la m�me classe 
Distance = kpv_distance(Data,mc);
[~,I] = sort(Distance,2);
Class = I(:,1);
Class= Class';

%% Nombre de points par classe
for i=1:M
    Nb(i)=length(find(Class==i));   
end

%% Calucle du crit�re de distance initial :
 J0=0 ;   
 for i=1:M
     for j=1:Nb(i)
      index=find(Class==i);
            Data_Class = Data(index,:);
           J0=J0+(Data_Class(j) - mc(i,:))*(Data_Class(j) - mc(i,:))';
 
     end 
 end

%% La boucle :
while J>e && q<4000
%% Calcule de nouveau centre de gravit�:
for i = 1 : M  
            index=find(Class==i);
            Data_Class = Data(index,:);
            % vecteur centre de gravit� de la classe i
            mc(i,:) = mean(Data_Class);      
end
%% Association des �chantillons les plus proches d'un CG � la m�me classe 
Distance= kpv_distance(Data,mc);
[~,I]=sort(Distance,2);
Class=I(:,1);
Class= Class';
%% Nombre de points par classe
for i=1:M
    Nb(i)=length(find(Class==i));   
end
%% Calucule du crit�ere J(i)
      J1=0 ;   
 for i=1:M
     for j=1:Nb(i)
index=find(Class==i, length(Class));
            Data_Class = Data(index,:);
           J1=J1+(Data_Class(j) - mc(i,:))*(Data_Class(j) - mc(i,:))';
     end 
 end
%% Critere d'arret :
if q == 0
    Ja =J0;
else
    Ja =Jn;
end
 Jn =J1;
 J=abs(Jn-Ja);
%J=Jn-Ja;
  q=q+1;  
end