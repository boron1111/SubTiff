% [filename,path]=uigetfile('*.tif');
% splitTo16(path,filename,'subtif\');

[filename,path]=uigetfile('*.tif');
truncateTif(path,filename,1,100,'subtif\');
