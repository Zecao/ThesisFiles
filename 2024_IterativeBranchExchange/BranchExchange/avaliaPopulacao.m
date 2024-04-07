% Avalia a funcao objetivo para a Populacao.
function [ fitness, alim, results ] = avaliaPopulacao(populacao, alim, forceRunMatpower) 

tamPopulacao = size(populacao,1);

% opcao fluxo 
if ( ~ strcmp(alim.funcao,'fluxo') )

    % decodifica populacao binaria 
    populacao = decodificaPopBinario(populacao, alim.funcao);

end

for i=1:tamPopulacao
    
    individuo = populacao(i, :);

    % verifica se ja foi avaliado
    [avaliadoBool, fit, results] = getStatusAvaliacaoInd(individuo, alim);

    % verifica se individuo ja foi avaliado
    if ( ~avaliadoBool )

        [ fit, alim, results ] = avaliaIndividuo(individuo, alim, forceRunMatpower);
    
    end

    % preenche fitness
    fitness(i,1) = fit;
    
end

end