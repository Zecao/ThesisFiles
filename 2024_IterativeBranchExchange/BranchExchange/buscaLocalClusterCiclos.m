% busca loca ciclo a ciclo
function [populacao, fxi] = buscaLocalClusterCiclos(populacao,fxi,alim)

% seleciona UM individuos p/ realizar busca local
[individuo, indFxi] = selecionaIndividuoBuscaLocal(populacao,fxi,alim);

% correcao de lacos da populacao 
[newPop,newFxi] = buscaLocalBranchExchangeClusterCiclos(individuo, alim);

if (isempty(newPop))
   return; 
end

% adiciona na nova populacao os individuos radiais
[populacao,fxi] = adicionaSeNaoExistir(newPop,newFxi,populacao,fxi,alim);

% % poda tam populacao
[populacao, fxi] = podaTamPopulacao(populacao,fxi,alim);

end