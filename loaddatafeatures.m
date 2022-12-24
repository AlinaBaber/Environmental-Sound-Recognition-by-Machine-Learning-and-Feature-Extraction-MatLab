function Status = loaddatafeatures()
File=load('Sound');
filepath=File.FilePath;
for i=1:1960
status= preparefile(File.FilePath{i})
end