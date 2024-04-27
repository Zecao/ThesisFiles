function [populacao, fxi] = buscaLocalPvt(populacao,fxi,alim)

% seleciona UM individuos p/ realizar busca local
individuo = selecionaIndividuoBuscaLocal(populacao,fxi,alim);

% condicao de retorno
if ( isempty(individuo) )    
    return;    
end

% correcao de lacos da populacao 
[newPop,newFxi] = buscaLocalBranchExchange(individuo, alim);

if (isempty(newPop))
    return;
end

% adiciona na nova populacao os individuos radiais
[populacao,fxi] = adicionaSeNaoExistir(newPop,newFxi,populacao,fxi,alim);

% % poda tam populacao
[populacao, fxi] = podaTamPopulacao(populacao,fxi,alim);

end


