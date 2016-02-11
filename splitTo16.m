function splitTo16(path,filename,destpath)
% Split a 2048*2048 multi-tiff into a series of
% tiff (512*512) into the destination path
% 
% splitTo16(path,filename,destpath) splits the file 
% at the path and named filename. The destination path
% is indicated by destpath

delete([destpath,filename(1:end-4),'_*.tif']);
a=imfinfo([path,'\',filename]);
for id=1:length(a)
    imdata=imread([path,'\',filename],'index',id);
    imdata_cell=mat2cell(imdata,[512 512 512 512],[512 512 512 512]);
    for id1=1:16
        flag=0;
        while flag==0
            try
                imwrite(imdata_cell{id1},[destpath,filename(1:end-4),'_',num2str(id1),'.tif'],'writemode','append','compression','none');
                flag=1;
            catch e
                pause(1)
                disp(e.message)
            end
        end
    end
    disp(id);
end
