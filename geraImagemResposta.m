function [imResposta] = geraImagemResposta(respostaObtidas, imagem)
% Funcao que recebe como parametro uma das 9 imagens e a tabela com as
% respostas e retorna uma imagem com as respostas obtidas na predicao

% Cada classe tem uma cor, sendo elas:
R1 = [50 205 50]; % tonalidade verde
R2 = [210 105 30]; % tonalidade marrom
R3 = [128 128 0]; % tonalidade oliva
R4 = [0 0 0]; % preto
numPixels = 93*125; % numero de pixels total de uma imagem

imResposta = zeros(93, 125, 3);
for i = (numPixels*(imagem - 1) + 1):(numPixels*imagem)
    if(respostaObtidas(i).Resposta == 'R1')
        imResposta(respostaObtidas(i).PosLinha, respostaObtidas(i).PosColuna, :) = uint8(R1);
    end
    if(respostaObtidas(i).Resposta == 'R2')
        imResposta(respostaObtidas(i).PosLinha, respostaObtidas(i).PosColuna, :) = uint8(R2);
    end
    if(respostaObtidas(i).Resposta == 'R3')
        imResposta(respostaObtidas(i).PosLinha, respostaObtidas(i).PosColuna, :) = uint8(R3);
    end
    if(respostaObtidas(i).Resposta == 'R4')
        imResposta(respostaObtidas(i).PosLinha, respostaObtidas(i).PosColuna, :) = uint8(R4);
    end
       
end

imResposta = uint8(imResposta);

end

