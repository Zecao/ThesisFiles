% busca loca ciclo a ciclo
function [populacao, fxi] = buscaLocalClusterCiclos(populacao,fxi,alim)

% FLAG P/ skipar o DistFlow nos Agrupamento (pois as chaves dos outros ciclos sao
% fechadas e DistFlow nao calcula malha)
alim.paramAG.skipDistFlowCluster = 1;

% seleciona UM individuos p/ realizar busca local
[individuo, indFxi] = selecionaIndividuoBuscaLocal(populacao,fxi,alim);

% correcao de lacos da populacao 
[newPop,newFxi] = buscaLocalBranchExchangeClusterCiclos(individuo, alim);

% TODO refactory
% se possui 1 ou 2 ciclos roda algoritmo original 
if (isempty(newPop))
    
    % FLAG
    alim.paramAG.skipDistFlowCluster = 0;
    % correcao de lacos da populacao 
    [newPop,newFxi] = buscaLocalBranchExchange(individuo, alim);

end

% adiciona na nova populacao os individuos radiais
[populacao,fxi] = adicionaSeNaoExistir(newPop,newFxi,populacao,fxi,alim);

% % poda tam populacao
[populacao, fxi] = podaTamPopulacao(populacao,fxi,alim);

% FLAG
alim.paramAG.skipDistFlowCluster = 0;

end

