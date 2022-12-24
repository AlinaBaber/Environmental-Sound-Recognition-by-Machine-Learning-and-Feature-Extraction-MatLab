function [Status] = knn_training()
File=load('Sound');
%==================Speech Disorder======================================%

rng(100);
KNNStruct_categories = fitcknn(real(File.Features55),File.categories1,'NumNeighbors',1);
save('knnmodels.mat','KNNStruct_categories','-append');
rng(100);
KNNStruct_categories1 = fitcknn(File.Features1,File.categories1,'NumNeighbors',5);
save('knnmodels.mat','KNNStruct_categories1','-append');
KNNStruct_categories2 = fitcknn(File.Features2,File.categories1,'NumNeighbors',1);
save('knnmodels.mat','KNNStruct_categories2','-append');
KNNStruct_categories3 = fitcknn(File.Features3,File.categories1,'NumNeighbors',1);
save('knnmodels.mat','KNNStruct_categories3','-append');
KNNStruct_categories4 = fitcknn(File.Features4,File.categories1,'NumNeighbors',1);
save('knnmodels.mat','KNNStruct_categories4','-append');
KNNStruct_categories5 = fitcknn([real(File.Features55),File.Features1,File.Features2,File.Features3,File.Features4],File.categories1,'NumNeighbors',1);
save('knnmodels.mat','KNNStruct_categories5','-append');
Status= 'KNN Model has been Trained';