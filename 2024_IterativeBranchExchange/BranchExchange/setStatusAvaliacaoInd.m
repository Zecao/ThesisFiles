% seta bool status avaliacao individuo
function alim = setStatusAvaliacaoInd(chave,perdas,results,alim)

% calcula Index Individuo
index = calculaIndexIndividuo(chave);

% seta bool p/ true
alim.paramAG.hashIndividuosCalculados(index) = perdas;
alim.paramAG.hashResultsCalculados(index) = results;

end