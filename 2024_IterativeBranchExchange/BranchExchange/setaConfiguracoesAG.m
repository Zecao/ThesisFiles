function conf = setaConfiguracoesAG(sistema)

% variavel que armazena se o fluxo ja foi calculado
paramAG = inicializaHash();

% criacao de populacao cemig
paramAG.metodoGerPopCemig = '2'; % 1 ou 2: mdo 1 cria menos individuos

% Flag p/ carregar Populacao de arquivo.MAT
paramAG.loadPopMAT = 0; 

% tipo de ordenacao dos ciclos
paramAG.tipoOrdCiclos = 'aleatorio'; % 'tamCiclo' 'aleatorio' 'revTamCiclo' 'cargaCiclo'

% lado de realizacao da BE
paramAG.ladoCicloBE = 'maiorQueda'; %'aleatorio';

% tipo de fluxo
paramAG.PFtype = 'Matpower'; %'AlimReduzido'; % Matpower DistFlow

% se = 1, faz BE com chaves fechadas
paramAG.closeAll = 0;

switch sistema
    
    case 0 % alimentadores Cemig
        
        paramAG.numGeracoes = 35;
        
    case 1 % 'alim\Sistema_Zhu2002_3fontes.txt';
        
        paramAG.maxPop = 5;
        paramAG.numGeracoes = 5;

    case 2 % 'Sistema_Zhu2002.txt'; 

        paramAG.maxPop = 5; % artigo
        paramAG.numGeracoes = 5;
%       paramAG.tipoOrdCiclos = 'tamCiclo';
%       paramAG.tipoOrdCiclos = 'cargaCiclo';
        paramAG.tipoOrdCiclos = 'aleatorio'; % melhor desempenho
                
    case 3 % Sistema_Huang2002.txt';

        paramAG.maxPop = 5; % artigo
        paramAG.numGeracoes = 5; 
        paramAG.tipoOrdCiclos = 'tamCiclo'; % melhor desempenho
%       paramAG.tipoOrdCiclos = 'aleatorio';
%       paramAG.tipoOrdCiclos = 'cargaCiclo'; % nao resolve a rede
        
    case 4 % Sistema_Brasileiro2008.txt';     

        paramAG.numGeracoes = 5;
        paramAG.maxPop = 10;
%         paramAG.tipoOrdCiclos = 'aleatorio'; % pessimos resultados
        paramAG.tipoOrdCiclos = 'tamCiclo'; % melhor
%       paramAG.tipoOrdCiclos = 'cargaCiclo';
       
% setup artigo (p/ nao resolver)         
%         paramAG.numGeracoes = 50;
%         paramAG.maxPop = 50;
%         paramAG.tamPopulacao = 10;
%         paramAG.tipoOrdCiclos = 'aleatorio';      
        
    case 5 % Sistema_TPC2003.txt';

        paramAG.maxPop = 5; % 10 artigo
        paramAG.numGeracoes = 5;
        paramAG.tipoOrdCiclos = 'aleatorio'; % melhor desempenho
%         paramAG.tipoOrdCiclos = 'tamCiclo';
%         paramAG.tipoOrdCiclos = 'cargaCiclo';

    case 6 % rede 417barras 
        
        paramAG.maxPop = 30;
        paramAG.numGeracoes = 30;
        paramAG.tipoOrdCiclos = 'aleatorio';     
        
    case 7 % rede 119 barras 
        
        paramAG.maxPop = 5;
        paramAG.numGeracoes = 10;
        paramAG.tipoOrdCiclos = 'tamCiclo'; % melhor
%         paramAG.tipoOrdCiclos = 'cargaCiclo';
%          paramAG.tipoOrdCiclos = 'aleatorio'; % nao da bons resultados

        
    case 8 % rede Carrano
        
        paramAG.tipoOrdCiclos = 'tamCiclo';
        paramAG.maxPop = 5;
        paramAG.numGeracoes = 5;     
        
    otherwise
        
end

conf = paramAG;

% variaveis Globais utilizadas em codigos antigos
criaVariaveisGlobais();

end

function criaVariaveisGlobais()

% parametros DE
global F;
global Cr; 
F = 0.5; % fator de escala mutacao
Cr = 0.1; % constante de cruzamento

% TODO eliminar
global Fm;
global Crm; 
Fm = 0.5; % fator de escala mutacao
Crm = 0.15; % constante de cruzamento

% % booleana de controle de variacao de Cr
global variaCr;
variaCr = false;

% % parametros alg genetico classico
global pMutacao; % probabilidade de mutacao
pMutacao = 0.05;

% % numero de bits de codificacao por variavel. 
% % utilizado por funcoes analiticas
global nBitsCod;
nBitsCod = 8;

end

% inicializa hash
function paramAG = inicializaHash()

paramAG.hashIndividuosCalculados = containers.Map('KeyType', 'char', 'ValueType', 'double');
paramAG.hashResultsCalculados = containers.Map('KeyType', 'char', 'ValueType', 'any');

% verifica se busca local jah foi aplicada ao individuo
paramAG.hashIndividuosOtmBuscaLocal = containers.Map('KeyType', 'char', 'ValueType', 'logical');
paramAG.hashIndividuosOtmBuscaLocalCluster = containers.Map('KeyType', 'char', 'ValueType', 'logical');
% paramAG.hashIndividuosOtmBuscaLocalTamCiclo = containers.Map('KeyType', 'char', 'ValueType', 'logical');

end