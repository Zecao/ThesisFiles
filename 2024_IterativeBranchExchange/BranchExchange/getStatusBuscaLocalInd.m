% verifica se individuo ja foi avaliado
function otimizadoBool = getStatusBuscaLocalInd(individuo,alim)

% calcula Index Individuo
index = calculaIndexIndividuo(individuo);

% OLD CODE manter
% if ( alim.paramAG.ligaAgrupamento == 1 )
%     
%     chaves = alim.paramAG.hashIndividuosOtmBuscaLocalCluster.keys();
%     
% else
     
% end

chaves = alim.paramAG.hashIndividuosOtmBuscaLocal.keys();

%  por logica, se index do individuo jah for membro das chaves do hashIndividuosOtmBuscaLocal
if (ismember(index,chaves))
    
    otimizadoBool = true;
     
else

    otimizadoBool = false;
    
end
 
end