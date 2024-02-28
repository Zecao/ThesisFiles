% verifica se individuo ja foi avaliado
function [avaliadoBool, fitness, results] = getStatusAvaliacaoInd(chave,alim)

% init vars
fitness = Inf;
avaliadoBool = false;
results =[];

% calcula Index Individuo
index = calculaIndexIndividuo(chave);

% obtem bool se ja avaliou ou nao individuo
chaves = alim.paramAG.hashIndividuosCalculados.keys();

% OBS: passou a dar pau qnd passei chave para char.
% chaves = cell2mat(alim.paramAG.hashIndividuosCalculados.keys());

if (ismember(index,chaves))

    fitness = alim.paramAG.hashIndividuosCalculados(index);
    
    avaliadoBool = true; 
    
    %
    results = alim.paramAG.hashResultsCalculados(index);
    
end
 
end