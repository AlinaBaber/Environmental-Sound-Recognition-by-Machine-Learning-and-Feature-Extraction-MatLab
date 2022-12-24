function [Category,Category_cost,Category_output,Category_Error]=neural_network_classification(wav_file)
Features= allfeatures_extraction( wav_file );
MFile= load('nnmodels'); File= load('speech');
%Tr_categories=MFile.NNTr_categories;
%Tr_emotions=MFile.NNTr_emotions;
[rn,col]=find(strcmp(File.FilePath,wav_file));
%targets1=transpose(File.categories_nn(col,:));
%==================Speech Disorder======================================%
% Test the Network
Features=transpose(Features);
Category_output=MFile.NNStruct_categories(Features);
%Category_errors = gsubtract(targets1,Category_output);
%Category_performance = perform(MFile.NNStruct_categories,targets1,Category_output);
%Category_performance= perform(MFile.NNStruct_categories,targets1(2),Category_output);
%Category_performance= max([performance1,performance2]);

A=max(Category_output);
Category_Error=1-max(Category_output);
index = find(strcmp(Category_output, A));
    Category=file.categories(index);
    Category_cost=[1,0,0,0,0,0,0,0];

% Plots
% Uncomment these lines to enable various plots.
% figure, plotperform(tr)
% figure, plottrainstate(tr)
%figure, plotconfusion(targets1,Category_output)
%figure, ploterrhist(Category_errors)
%Categories_errors = gsubtract(targets,frequency_categories_outputs);
%Categories_performance = perform(MFile.NNStruct_frequency_categories,targets,frequency_categories_outputs);
