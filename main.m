delete write.tif
[filename,path]=uigetfile('*.tif');
a=imfinfo([path,'\',filename]);

for id=1:length(a)
    imdata=imread([path,'\',filename],'index',id);
    imdata_cell=mat2cell(imdata,[512 512 512 512],[512 512 512 512]);
    for id1=1:16 
        imwrite(imdata_cell{id1},['subtif\',filename(1:end-4),'_',num2str(id1),'.tif'],'writemode','append','compression','none');
    end
    disp(id);
end

