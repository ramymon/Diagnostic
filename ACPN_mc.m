%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                              %                                                                        %
%    Fichier acpn_apres_cmeans.m : Analyse en Composantes Principales    %
%    Normalisees et superposition d'individus supplémentaires            %
%    (toutes les composantes principales sont comprises entre 0 et 1)    %
%                                                                        % 
%    Au depart, le jeu de donnees est centre et reduit. Ainsi, la        %
%    matrice d'inertie du nuage, ou matrice de variance-covariance       %
%    est egalement la matrice de correlation des variables.              %
%									 															 %
%    Ce programme permet de projeter les individus sur differents plans  %
%    ainsi que les variables normees (car le jeu est centre-reduit).     %
%									 															 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                     
%--- Prise en compte d'individus supplementaires si necessaire ----%
%------------ Centrage et reduction du jeu d'individus ------------%
%--------- supplementaires par rapport au jeu de donnees x --------%                                              
n=size(mc,1);
mc = (mc-ones(n,1)*mean(Data))./(ones(n,1)*std(Data));
%------------------------------------------------------------------%
%% --------- Calcul des projections des points de x par ACP ---------%%
S = (Data'*Data)/N;     % Matrice d'inertie du nuage ; la metrique est I ; Dp=1/n.
		  				% Le nuage de points etant centre (m=(0,0)) reduit
                  % (std(vari)=1)), la matrice d'inertie S 
                  % est aussi la matrice de variance-covariance.
[V,D]=eig(S);     % D=valeur propre de S dans une matrice diagonale. 
                  % V=matrice dont chaque colonne est le vecteur propre tel que
                  % S*V = V*D. Les vecteurs propres sont normes.
D = diag(D);      % D=vecteur des valeurs propres.
[Y,I] = sort(-D);
D=D(I);           % On ordonne les valeurs propres dans l'ordre decroissant.
V = V(:,I);       % On ordonne les vecteurs propres selon l'ordre des vp.
		  % V donne la constitution des axes.

%% ----- Projection des individus supplementaires dans les plans de l'ACP ------%%
coor_ind_sup = mc * V; % calcul des coordonnees de projection des
                  				% individus supplementaires.                               
%% %%%%%%%%      Graphique : projection des points sur le      %%%%%%%% %%
%%%%%%%%%%                plan factoriel                      %%%%%%%%%%
hold on;
grid on

%for i=1:M
    %scatter(coor_ind_sup(i,1),coor_ind_sup(i,2),'+','LineWidth',3);
%hold on 
%end
scatter(coor_ind_sup(:,1),coor_ind_sup(:,2),'+','LineWidth',1.5)

xlabel('Axe 1');
ylabel('Axe 2');
title('ACP')
%%