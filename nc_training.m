function Status = nc_training()
File=load('Sound');
%==================Speech Disorder======================================%
%----(1)----------Frequency--------------

rng(100);
NBStruct_categories = fitcnb(real(File.Features55),File.categories1);
save('NBmodels.mat','NBStruct_categories','-append');
rng(100);
NBStruct_categories1 = fitcnb(File.Features1,File.categories1);
save('NBmodels.mat','NBStruct_categories1','-append');
NBStruct_categories2 = fitcnb(File.Features2,File.categories1);
save('NBmodels.mat','NBStruct_categories2','-append');
NBStruct_categories3 = fitcnb(File.Features3,File.categories1);
save('NBmodels.mat','NBStruct_categories3','-append');
NBStruct_categories4 = fitcnb(File.Features4,File.categories1);
save('NBmodels.mat','NBStruct_categories4','-append');
NBStruct_categories5 = fitcnb([real(File.Features55),File.Features1,File.Features2,File.Features3,File.Features4],File.categories1);
save('NBmodels.mat','NBStruct_categories5','-append');
Status= 'NB Model has been Trained';