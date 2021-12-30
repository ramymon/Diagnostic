%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                              %                                                                        %
%    Fichier acpn.m : Analyse en Composantes Principales Normalisees     %
%    (toutes les composantes principales sont comprises entre 0 et 1).   %
%                                                                        % 
%    Au depart, le jeu de donnees est centre (moyenne nulle) et reduit   %
%    (variance unite). Ainsi, la matrice d'inertie du nuage, ou matrice  %      
%    de variance-covariance est egalement la matrice de correlation      %
%    des variables.              										 %
%									 								     %
%    Ce programme permet de projeter les individus sur differents plans. %
%									 									 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                         
%%                                                  
[N,d] = size(DataT); % N est le nombre d'echanttillon , d est le nombre des paramètre de depart

%% ----- Centrage et reduction du jeu de donnees si necessaire ------%

DataT = (DataT-ones(N,1)*mean(DataT))./(ones(N,1)*std(DataT));

%% --------- Calcul des projections des points de x par ACP ---------%

S = (DataT'*DataT)/N;    	% Matrice d'inertie du nuage ; la metrique est I ; Dp=1/n.
		  				% Le nuage de points etant centre (m=(0,0)) reduit
                  % (std(vari)=1)), la matrice d'inertie S 
                  % est aussi la matrice de variance-covariance.
[V,D]=eig(S);     % D = valeur propre de S dans une matrice diagonale. 
                  % V=matrice dont chaque colonne est le vecteur propre tel que
                  % S*V = V*D. Les vecteurs propres sont normes.
D = diag(D);      % D=vecteur des valeurs propres.
[Y,I] = sort(-D);
D=D(I);           % On ordonne les valeurs propres dans l'ordre decroissant.
V = V(:,I);       % On ordonne les vecteurs propres selon l'ordre des vp.
		  				% V donne la constitution des axes.
coor = DataT * V;     % Calcul des nouvelles coordonnees des points de x, par proj-
                  % -ection orthogonale d'un vecteur qcq sur un axe defini par 
                  % un vecteur unitaire. Ces coordonnees sont ordonnees.
%% --------- Projection des variables dans les plans de l'ACP ---------%
%coor_var=(ones(d,1)*sqrt(D')).*V;
%% --------- Inertie expliquee par les plans ---------%
if d == 3
I_plan1_2=(D(1)+D(2))/sum(D);
I_plan1_3=(D(1)+D(3))/sum(D);
I_plan2_3=(D(2)+D(3))/sum(D);
Inertie_expl=[D(1)/sum(D) ; I_plan1_2 ; I_plan1_3 ; I_plan2_3]; 
disp(Inertie_expl)
end
%%
if d == 4
I_plan1_2=(D(1)+D(2))/sum(D);

I_plan1_3=(D(1)+D(3))/sum(D);
I_plan1_4=(D(1)+D(4))/sum(D);
I_plan2_3=(D(2)+D(3))/sum(D);
I_plan2_4=(D(2)+D(4))/sum(D);
Inertie_expl=[D(1)/sum(D) ; I_plan1_2 ; I_plan1_3 ; I_plan1_4 ; I_plan2_3 ; I_plan2_4];
disp(Inertie_expl)
end
%%
if d == 5
I_plan1_2=(D(1)+D(2))/sum(D);
I_plan1_3=(D(1)+D(3))/sum(D);
I_plan1_4=(D(1)+D(4))/sum(D);
I_plan1_5=(D(1)+D(5))/sum(D);
I_plan2_3=(D(2)+D(3))/sum(D);
I_plan2_4=(D(2)+D(4))/sum(D);
I_plan2_5=(D(2,:)+D(5,:))/sum(D);
Inertie_expl=[D(1)/sum(D) ; I_plan1_2 ; I_plan1_3 ; I_plan1_4 ; I_plan1_5 ; I_plan2_3 ; I_plan2_4 ; I_plan2_5];
disp(Inertie_expl);
end
%% %%%%%%%%|    Graphique : projection des points sur le    |%%%%%%%% %%
%%%%%%%%%%%|              plan factoriel                    |%%%%%%%%%%%

for i=1:M
        index=find(ClassTest==i);
            Data_Class = coor(index,:);
            % vecteur centre de gravité de la classe i
            scatter(Data_Class(:,1),Data_Class(:,2),'+') 
          
            hold on 
end

hold on


grid on
xlabel('Axe 1');
ylabel('Axe 2');
title('ACP');
hold on
%%  