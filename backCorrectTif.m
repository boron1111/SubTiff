function backCorrectTif(path,filename,destpath)
% backCorrectTif(file) gives the tif file at path
% named filename a background correct through
% the function backgroundCorrect and saves the
% corrected file at destpath

a=imfinfo([path,'\',filename]);
delete([destpath,filename(1:end-4),'_backCorrected','.tif']);
for id=1:length(a)
    imdata=imread([path,'\',filename],'index',id);
    imdata_correct=backgroundCorrect(imdata);
    imwrite(imdata_correct,[destpath,filename(1:end-4),'_backCorrected','.tif'],'writemode','append','compression','none');
end
