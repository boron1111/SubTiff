function registerTif(path,filename,destpath)
% Register a multi-tiff according to the 1st frame and form a new file
% into the destination path
% 
% registerTiff(path,filename,destpath) register the file 
% at the path and named filename. The destination path
% is indicated by destpath

delete([destpath,filename(1:end-4),'_reg.tif']);
a=imfinfo([path,'\',filename]);
im_ref=imread([path,'\',filename],'index',1);
imwrite(im_ref,[destpath,filename(1:end-4),'_reg','.tif'],'writemode','append','compression','none');
for id=2:length(a)
    imdata=imread([path,'\',filename],'index',id);
    [imdata_reg offset]=image_register_correlation(im_ref,imdata);
    flag=0;
    while flag==0
        try
            imwrite(imdata_reg,[destpath,filename(1:end-4),'_reg','.tif'],'writemode','append','compression','none');
            flag=1;
        catch e
            pause(1)
            disp(e.message)
        end
    end
    disp([id offset]);
end
