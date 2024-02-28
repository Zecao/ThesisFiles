% seta status de BuscaLocal do individuo p/ true  
function setStatusBuscaLocalInd(individuo,alim)

% calcula Index Individuo
index = calculaIndexIndividuo(individuo);

if ( strcmp(alim.paramAG.tipoOrdCiclos,'cluster'))
    
    alim.paramAG.hashIndividuosOtmBuscaLocalCluster(index) = true;

else
    
    alim.paramAG.hashIndividuosOtmBuscaLocal(index) = true;

end

end