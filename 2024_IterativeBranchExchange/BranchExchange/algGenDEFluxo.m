%
function [arrayStructElite, populacao, fitness, k] = algGenDEFluxo( alim, algoritmo, sistema )

% gera populacao inicial Alim
[populacao, fitness] = geraPopulacao(alim);

% inicio variaveis while
k = 1; % contador de geracoes

% cria struct elite 
arrayStructElite = criaArrayStructElite(alim.paramAG.numGeracoes,alim);

% repete o numero de geracoes
while ( k <= alim.paramAG.numGeracoes )

    % roda Evolucao Diferencial de acordo com o tipo do algoritmo
    [populacao, fitness] = runAlgorithm(algoritmo, alim, populacao, fitness, k);
    
    % Elitismo. Guarda o melhor individuo
    arrayStructElite = preencheArrayStructElite(arrayStructElite,fitness,populacao,k);
    
    % stop criteria
    stop = stopCriteria(sistema,arrayStructElite,k,alim);
    
    if ( stop )
        return;
    end  
    
    % Atualiza geracao    
    k = k + 1; 

end
    
end

% verifies the stop criteria
function stop = stopCriteria(sistema,arrayStructElite,k,alim)

% init var
stop = 0;

% TODO
% for the 119 and 136-bus we have to compare 2 generations before.
% if ((sistema==7)||(sistema==4))
    if (k>2)
        elite = arrayStructElite(1, k).FFxXGen;

        old = arrayStructElite(1, k-2).FFxXGen;

        % no improvement in last generation
        if (elite == old)

            stop = 1;
            return;
        end

    end
% else
%     if (k>1)
%         elite = arrayStructElite(1, k).FFxXGen;
% 
%         old = arrayStructElite(1, k-1).FFxXGen;
% 
%         % no improvement in last generation
%         if (elite == old)
% 
%             stop = 1;
%             return;
%         end
% 
%     end
% 
% end

% debug mode: stop when found the known optima 
[stop, arrayStructElite] = verificaSucesso(sistema,arrayStructElite,k,alim);

end

% verifica diversidade populacional
function baixaDiversidade = verificaDiversidadePopulacional(arrayStructElite,geracao,alim)

fbest = arrayStructElite(1, geracao).FFxXGen;

fmed = arrayStructElite(1, geracao).FFxmedioXGen;

% OBS: o idg esta implentado conforme a sugestao do artigo (Vasconcelos, et alli, 2001) 
% gmg original fmed/fbest 
% caso a funcao fitness fosse positiva (isto é, inviduos mais bem 
% adaptados -> fitness maior), sugere-se utilizar idg = fbest/fmed,

idg = abs(fmed/fbest);

if ( idg <= alim.paramAG.limiteIDG)
    
    baixaDiversidade = true;

else
    
    baixaDiversidade = false;

end

% DEBUG
fbestDEBUG = 1/fbest;
fmedDEBUG = 1/fmed;
idgDEBUG = 1/idg;
limIDG = 1/alim.paramAG.limiteIDG;

if (idgDEBUG > limIDG)
    
    debug = 0;
    
end

end
  
% verifica sucesso 
function [sucesso, arrayStructElite] = verificaSucesso(sistema,arrayStructElite,geracao,alim)

% condicao de saida funcao
if (alim.paramAG.debugMode == 0)
    sucesso = 0;
    return ;
end

% get elite da geracao
elite = arrayStructElite(1, geracao).FmelhorIndXGen; 

% get otimo
indOtimos = getIndividuoOtimo(sistema,alim);

% se ha mais de 1 individuo otimo
if (size(indOtimos,1)>1)

    %
    comparacao = ( indOtimos(1,:) == elite ) | ( indOtimos(2,:) == elite );
    
else
   
    % compara individuos
    comparacao = indOtimos == elite;

end

% preenche flag sucesso
if (all(comparacao))
    
    sucesso = true;

else
    
    sucesso = false;
    
end

end

% Elitismo. Guarda o melhor individuo
function arrayStructElite = preencheArrayStructElite(arrayStructElite,fitness,populacao,geracao)

% obtem indice do elite 
[eliteHx, indiceElite] = min(fitness);
individuoElite = populacao(indiceElite,:);

% vetor que guarda melhor individuo da geracao
arrayStructElite(geracao).FmelhorIndXGen =  individuoElite;

% Guarda valor da funcao para elite
arrayStructElite(geracao).FFxXGen = eliteHx; 

% Guarda media dos fitness
arrayStructElite(geracao).FFxmedioXGen = mean(fitness);

end

% cria array de structs elite 
function arrayStructElite = criaArrayStructElite(numGeracoes,alim)

%retorna o numero de variaveis e dominio(range) dado o nome da funcao
[rangeFunction, nVars] = rangeFuncao(alim.funcao,alim);

global param;

eliteStruct = struct;
eliteStruct = setfield(eliteStruct,'FmelhorIndXGen', []);
eliteStruct = setfield(eliteStruct,'FFxXGen', []);
eliteStruct = setfield(eliteStruct,'FFxmedioXGen', []);
eliteStruct.FmelhorIndXGen = zeros(nVars,1,param.dataType);
eliteStruct.FFxXGen = 0;
eliteStruct.FFxmedioXGen = 0;

for i=1:numGeracoes

    arrayStructElite(i) = eliteStruct;
    
end

end
