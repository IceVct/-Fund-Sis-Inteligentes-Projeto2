function [valRGB, rotulos] = leLabelsValores(filename1, filename2)
% Funcao que recebe dois nomes de arquivos, correspondentes aos valores RGB
% e rotulos da imagem 6, e retorna uma matriz para os valores e um vetor de
% rotulos

%% Lendo o arquivo filename1, que vai consistir nos valores RGB
valRGB = zeros(100, 3); % 100 elementos e 3 valores para cada coluna
sizevalRGB = [3 100];

fid = fopen(filename1, 'r');

valRGB = fscanf(fid,'%d %d %d',sizevalRGB);
valRGB = valRGB';

fclose(fid);


%% Lendo o arquivo filename2, que vai consistir nos rotulos
rotulos = {}; % inicializando a celula rotulos

fid = fopen(filename2);

tline = fgetl(fid);
while ischar(tline)
    rotulos = [rotulos tline];
    tline = fgetl(fid);
end
fclose(fid);

rotulos = rotulos';

end

