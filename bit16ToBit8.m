function bit16ToBit8(path,filename,destpath)
% bit16ToBit(path,filename,destpath) converts tif file
% at path named filename from 16 bit to 8 bit to for a
% new file at destpath

a=imfinfo([path,'\',filename]);
delete([destpath,filename(1:end-4),'_8bit','.tif']);
for id=1:length(a)
    imdata=imread([path,'\',filename],'index',id);
    imdata_correct=uint8(double(imdata)/4095*255);
    imwrite(imdata_correct,[destpath,filename(1:end-4),'_8bit','.tif'],'writemode','append','compression','none');
end
