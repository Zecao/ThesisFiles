% verifica se individuo ja foi avaliado
function otimizadoBool = getStatusBuscaLocalInd(individuo,alim)

% calcula Index Individuo
index = calculaIndexIndividuo(individuo);

% chaves do hashIndividuosOtmBuscaLocal
if (strcmp(alim.paramAG.tipoOrdCiclos,'cluster'))
    
    chaves = alim.paramAG.hashIndividuosOtmBuscaLocalCluster.keys();
    
else
    
    chaves = alim.paramAG.hashIndividuosOtmBuscaLocal.keys();
    
end

%  por logica, se index do individuo jah for membro das chaves do hashIndividuosOtmBuscaLocal
if (ismember(index,chaves))
    
    otimizadoBool = true;
     
else

    otimizadoBool = false;
    
end
 
end