function splitTo16(path,filename,destpath)
% Split a 2048*2048 multi-tiff into a series of
% tiff (512*512) into the destination path
% 
% splitTo16(path,filename,destpath) splits the file 
% at the path and named filename. The destination path
% is indicated by destpath

a=imfinfo([path,'\',filename]);
for id=1:length(a)
    imdata=imread([path,'\',filename],'index',id);
    imdata_cell=mat2cell(imdata,[512 512 512 512],[512 512 512 512]);
    for id1=1:16 
        imwrite(imdata_cell{id1},[destpath,filename(1:end-4),'_',num2str(id1),'.tif'],'writemode','append','compression','none');
    end
    disp(id);
end
