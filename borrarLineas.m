function borrarLineas

p=1;
ruta='carpeta';
archivo='nuevo2.txt';

archivoPrin=fopen('salida.txt');

lineaPrin = fgetl(archivoPrin);

while lineaPrin ~=-1
    if p==1
        ar=fopen(['./' ruta '/' archivo]);
        ar2=fopen(['./' ruta '/fileT.txt'],'w+');
        p=0;
        final='fileT';
    else
        ar=fopen(['./' ruta '/fileT.txt']);
        ar2=fopen(['./' ruta '/' archivo],'w+');
        final=archivo;
        p=1;
    end
    
    li=fgetl(ar);
    
    while li ~=-1
        liT=strsplit(li,'/');
        liT=char(liT(end));
        
        if strcmp(lineaPrin,liT)==0%son diferentes
            fprintf(ar2,'%s\n',li);
        end
        
        li=fgetl(ar);
    end
    
    fclose(ar);
    fclose(ar2);
    
    lineaPrin = fgetl(archivoPrin);
end

fclose(archivoPrin);

disp(final)
movefile(['./carpeta/' final '.txt'], ['./carpeta/Nuevo_' archivo]);
