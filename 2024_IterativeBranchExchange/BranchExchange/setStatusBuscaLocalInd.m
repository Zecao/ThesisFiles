% seta status de BuscaLocal do individuo p/ true  
function setStatusBuscaLocalInd(individuo,alim)

% calcula Index Individuo
index = calculaIndexIndividuo(individuo);

% OLD CODE manter
% if ( alim.paramAG.ligaAgrupamento == 1 )
%     
%     alim.paramAG.hashIndividuosOtmBuscaLocalCluster(index) = true;
% 
% else
%     
%     alim.paramAG.hashIndividuosOtmBuscaLocal(index) = true;
% 
% end

alim.paramAG.hashIndividuosOtmBuscaLocal(index) = true;

end