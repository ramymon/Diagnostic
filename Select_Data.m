function [Data]=Select_Data(Titre,fileType)

[DataName,~] = uigetfile([[ pwd '\'] ,fileType],Titre ,'MultiSelect','off');
R_Data =load (DataName);
if strcmp(DataName,'iris.mat')
    Data = R_Data.iris_trset(:,1:4); 
else
    Data=R_Data.x;
end
return



