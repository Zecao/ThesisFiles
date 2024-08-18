clc; 
clear global;
format long;
warning 'off'; 

% reset the random number generator for reproducibility  
rng('default');

% sistema = 1 -> 16-bus   
% sistema = 2 -> 33-bus         
% sistema = 3 -> 69-bus PG&E Bran&Wu  
% sistema = 4 -> 136-bus Sistema_Brasileiro 
% sistema = 5 -> 84-bus TPC2003
% sistema = 6 -> 417-bus
% sistema = 7 -> 119-bus
sistema = 4;

% ALGORITMOS 
% 521 % Only branch Exchange 
algoritmo = 521;

% seta path do aplicativo
setPath();

%numero de execucoes
numexec = 10;

% inicializa var
matrizResultados =[];

for i=1:numexec
    
    % time 1 run
    tstart = tic;
    
    % define variaveis globais
    defineParametrosGerais();
    
    % seta configuracoes do algoritmo genetico
    conf = setaConfiguracoesAG(sistema);
        
    % carregaArquivoAlimentador
    alim = carregaAlimentadorDeTxt(sistema,conf);
     
    [arrayStructElite, populacao, fitness, geracao] = algGenDEFluxo( alim, algoritmo, sistema );

    % time 1 run
    telapsed = toc(tstart);
    
    % vetor resultados 
    matrizResultados(:,i) = criaVetorResultados(algoritmo,arrayStructElite,telapsed,alim);
        
end

% grava em txt desempenho do AG
plotaInfoAG2(algoritmo, sistema, numexec, matrizResultados);

beep;

% show results
FILENAME = strcat('InfoAG',num2str(algoritmo),'_',num2str(sistema),'_',num2str(numexec),'.txt');
open(FILENAME)