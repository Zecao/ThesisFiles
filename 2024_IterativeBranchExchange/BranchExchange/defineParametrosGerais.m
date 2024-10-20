%definicao variaveis globais
function defineParametrosGerais()

global param;

param.lstChaves = [];

% imprime variavel do fluxo 
param.OUT_ALL = 0;

% tipo de fluxo de potencia: Optimal Power Flow ou normal 
% 1 PF
% 11 PF c/ gravacao dos resultados
% 2 OPF 
% 22 OPF c/ gravacao dos resultados
param.metodoFluxo = 1; 

% dataType dos individuos
param.dataType = 'int32';

% globals do Matpower
param.VMAX = 1.1; % maximum voltage magnitude (p.u.) 
param.VMIN = 0.49; % minimum voltage magnitude (p.u.) 

% variavel que conta o numero de execucoes de funcoes (ou fluxo de
% potencia) dos Algoritmos Geneticos
param.NCAL = 0;

% contador de avaliacoes das funcoes busca local
param.NCALBL = 0;

% contador de DFS
param.contTestesRadialidade = 0;

% contador 
param.SucessoSEL =0;

end