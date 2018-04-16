%% Script principal do projeto 2
% Alvaro Torres Vieira - 
% Victor Araujo Vieira - 14/0032801


listaImagens = {};
strAux1 = './projeto2_imagens/photo-';
strAux2 = '-orig.jpg';
% vai ter todas imagens menos a 6
for i = 1:10
    if(i < 6)
        listaImagens{i} = [strAux1 num2str(i) strAux2];
    end
    if(i > 6)
        listaImagens{i - 1} = [strAux1 num2str(i) strAux2];
    end
end

%% Obtendo os valores RGB e os rotulos das regioes associadas
[valRGB, rotulos] = leLabelsValores('RGBvalues.txt', 'labels.txt');

% Variavel que escolhe qual metodo sera utilizado:
% 0 - Bayes
% 1 - LDA
% 2 - QDA
% 3 - Knn
modelo = 1;

%% Bayes
if(modelo == 0)
    firstTimeBayes = 0; % vai controlar se vai ou nao executar de novo o treinamento e validacao
    
    if(firstTimeBayes)
        [modeloBayes, respostaObtidasBayes] = bayesClassification(valRGB, rotulos, listaImagens);
        save('modeloBayes.mat', 'modeloBayes');
        save('respostasBayes.mat', 'respostaObtidasBayes');
    else
        load('respostasBayes.mat');
        load('modeloBayes.mat');
    end
end

%% LDA
if(modelo == 1)
    firstTimeLDA = 0; % vai controlar se vai ou nao executar de novo o treinamento e validacao
    
    if(firstTimeLDA)
        [modeloLDA, respostaObtidasLDA] = ldaClassification(valRGB, rotulos, listaImagens);
        save('modeloLDA.mat', 'modeloLDA');
        save('respostaLDA.mat', 'respostaObtidasLDA');
    else
        load('respostaLDA.mat');
        load('modeloLDA.mat');
    end
end


%% QDA
if(modelo == 2)
    firstTimeQDA = 1; % vai controlar se vai ou nao executar de novo o treinamento e validacao
    
    if(firstTimeQDA)
        [modeloQDA, respostaObtidasQDA] = qdaClassification(valRGB, rotulos, listaImagens);
        save('modeloQDA.mat', 'modeloQDA');
        save('respostaQDA.mat', 'respostaObtidasQDA');
    else
        load('respostaQDA.mat');
        load('modeloQDA.mat');
    end
end

 %% KNN
if(modelo == 3)
    firstTimeKNN = 1; % vai controlar se vai ou nao executar de novo o treinamento e validacao
    
    if(firstTimeKNN)
        [modeloKNN, respostaObtidasKNN] = knnClassification(valRGB, rotulos, listaImagens);
        save('modeloKNN.mat', 'modeloKNN');
        save('respostaKNN.mat', 'respostaObtidasKNN');
    else
        load('respostaKNN.mat');
        load('modeloKNN.mat');
    end
end

 
