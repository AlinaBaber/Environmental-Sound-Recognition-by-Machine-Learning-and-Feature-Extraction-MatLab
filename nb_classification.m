function [Category,Category_score,Categories_error,Category_cost] = nb_classification(wav_file)
Features= allfeatures_extraction( wav_file );
Features1= allfeatures_extraction1( wav_file );
Features2= allfeatures_extraction2( wav_file );
Features3= allfeatures_extraction3( wav_file );
Features4= allfeatures_extraction4( wav_file );
MFile= load('NBmodels');
%==================NB Models======================================%
[Category1,Category_score1,Category_cost1] = predict(MFile.NBStruct_categories,real(Features));
[Category2,Category_score2,Category_cost2] = predict(MFile.NBStruct_categories1,Features1);
[Category3,Category_score3,Category_cost3] = predict(MFile.NBStruct_categories2,Features2);
[Category4,Category_score4,Category_cost4] = predict(MFile.NBStruct_categories3,Features3);
[Category5,Category_score5,Category_cost5] = predict(MFile.NBStruct_categories4,Features4);

Categories_error1 = loss(MFile.NBStruct_categories,real(Features),Category1);
Categories_error2 = loss(MFile.NBStruct_categories1,Features1,Category2);
Categories_error3 = loss(MFile.NBStruct_categories2,Features2,Category3);
Categories_error4 = loss(MFile.NBStruct_categories3,Features3,Category4);
Categories_error5 = loss(MFile.NBStruct_categories4,Features4,Category5);
[Category6,Category_score6,Category_cost6] = predict(MFile.NBStruct_categories5,[real(Features),Features1,Features2,Features3,Features4]);
Categories_error6 = loss(MFile.NBStruct_categories4,Features4,Category5);
Category=[Category1,Category2,Category3,Category4,Category5,Category6];
Category_score=[Category_score1;Category_score2;Category_score3;Category_score4;Category_score5;Category_score6];
Category_cost=[Category_cost1;Category_cost2;Category_cost3;Category_cost4;Category_cost5;Category_cost6];
Categories_error=[Categories_error1;Categories_error2;Categories_error3;Categories_error4;Categories_error5;Categories_error6];
