function truncateTif(path,filename,begin1,end1,destpath)
% cut a series of images in a tif out as a tif
% 
% truncateTif(path,filename,begin1,end1,destpath) cut a tif
% file at path named filename from begin to end to form a
% new tif file at destpath

delete([destpath,filename(1:end-4),'_',num2str(begin1),'_',num2str(end1),'.tif']);
for id=begin1:end1
    imdata=imread([path,'\',filename],'index',id);
    imwrite(imdata,[destpath,filename(1:end-4),'_',num2str(begin1),'_',num2str(end1),'.tif'],'writemode','append','compression','none');
end