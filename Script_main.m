%% Choix de données à traiter : 
Data = Select_Data('Choisir Un jeux de données pour le traiter','*.mat');
M = input('indiquer le nombre de classe à chercher');
[l,d] = size(Data);


%%  Visualiser les classes :
if d==2
    scatter(Data(:,1),Data(:,2))
   % scatter(Data(1:round(l/2),1),Data(1:round(l/2),2),'r')
  %  hold on 
  %scatter(Data(round(1/2)+1:l,1),Data(round(1/2)+1:l,2),'c')
 % hold off
else 
    figure(1)
  ACPN     
end
%% C_means :
ClassFinder_V2

%% 
figure(2)
if d==2
    hold on
    grid on 
for i=1:M
        index=find(Class==i);
            Data_Class = Data(index,:);
            % vecteur centre de gravité de la classe i
            scatter(Data_Class(:,1),Data_Class(:,2)) 
            hold on 
    
    scatter(mc(i,1),mc(i,2),'k+','LineWidth',3);
hold on
end

end 
figure(2)

%%  Visualiser les centre des gravités :
figure(1)
hold on 
if d==2
    hold on
    grid on 
for i=1:M
    
    
    scatter(mc(i,1),mc(i,2),'k+','LineWidth',3);
hold on 
end 


 figure(2)
else
  ACPN_mc     
end
%%
