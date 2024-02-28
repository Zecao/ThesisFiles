% poda tamanho da populacao excluindo piores individuos
function [populacao, fxi] = podaTamPopulacao(populacao,fxi,alim)

% poda populacao, mantendo o tamanho fixo

if (length(fxi) > alim.paramAG.maxPop)
    
    populacao = populacao(1:alim.paramAG.maxPop,:);
    fxi = fxi(1:alim.paramAG.maxPop,1);
    
end

end