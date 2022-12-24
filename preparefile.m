function [status]= preparefile(FilePath)

[pathstr,FileName,ext] = fileparts(FilePath);
[pathstr,categories,ext] = fileparts(pathstr) ;
File=load('Sound');
%File_Name={FileName}; 
%File.FileName(end+1)=File_Name; 
%FileName=File.FileName;
%save('Sound.mat','FileName1','-append');
%File_Path={FilePath};
%File.FilePath(end+1)=File_Path; 
%FilePath=File.FilePath;
%save('Sound.mat','FilePath','-append');
%File_catergory={categories};
%categories1=[File.categories1; File_catergory];
%save('Sound.mat','categories1','-append');
%nn=strcmp(File_catergory,'kitchen');
%ss=strcmp(File_catergory,'living');
%nb=strcmp(File_catergory,'meeting');
%sb=strcmp(File_catergory,'office');
%st=strcmp(File_catergory,'washing');
%categories_number=[nn,ss,nb,sb,st];
%categories_nn=[File.categories_nn;categories_number];
%save('Sound.mat','categories_nn','-append');
Features= allfeatures_extraction( FilePath );
%------(1)--------- Features-----------
File_features=Features; 
%File.frequency(end+1,end+1)=File_Frequency; 
Features=[File.Features;File_features;];
save('Sound.mat','Features','-append');
status=' All Features are Extracted ,File is Prepared for Training';