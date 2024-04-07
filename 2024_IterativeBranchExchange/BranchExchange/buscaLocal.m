% encapsula busca local
function [populacao, fxi] = buscaLocal(populacao,fxi,alim,geracao)

sis = getSistema(alim.Fnome);

switch (sis)
    
    case 4
        
        % PF: 137.0
        [populacao, fxi] = setup136barras(populacao,fxi,alim,geracao);
        
    case 6

        % PF:
        [populacao, fxi] = setup417barras(populacao,fxi,alim,geracao);
        
    case 7
        
        % PF: 185.0
        [populacao, fxi] = setup119barras(populacao,fxi,alim,geracao);
    
    otherwise  % busca local
        
        [populacao, fxi] = buscaLocalElite(populacao,fxi,alim);
    
end

end

% BL tamCiclo ou aleatorio. Se nao otimizou, tenta por Cluster.
function [populacao, fxi] = setup119barras(populacao,fxi,alim,geracao)

if (mod(geracao,2)==1)
    [populacao, fxi] = buscaLocalElite(populacao,fxi,alim);
else
    % busca local por ciclos
    [populacao, fxi] = buscaLocalClusterCiclos(populacao,fxi,alim); 
end

end

% BL tamCiclo ou aleatorio. Se nao otimizou, tenta por Cluster.
function [populacao, fxi] = setup136barras(populacao,fxi,alim,geracao)

if (mod(geracao,2)==1)
    [populacao, fxi] = buscaLocalElite(populacao,fxi,alim);
else
    % busca local por ciclos
    [populacao, fxi] = buscaLocalClusterCiclos(populacao,fxi,alim); 
end

end

% evita a BE classico, porque o mesmo leva a sub otimo local
function [populacao, fxi] = setup417barras(populacao,fxi,alim,geracao)

if (mod(geracao,2)==1)
    [populacao, fxi] = buscaLocalElite(populacao,fxi,alim);
else
    % busca local por ciclos
    [populacao, fxi] = buscaLocalClusterCiclos(populacao,fxi,alim); 
end
    
end

% BL tamCiclo ou aleatorio. Se nao otimizou, tenta por Cluster.
function [populacao, fxi] = setup417barras_r2(populacao,fxi,alim,geracao)

% if (mod(geracao,2)==1)
if (geracao==1)
    alim.paramAG.tipoOrdCiclos = 'tamCiclo';
    
else
    alim.paramAG.tipoOrdCiclos = 'aleatorio';
end

% fitness Inicial
fitOld = fxi(1);

% busca local
[populacao, fxi] = buscaLocalElite(populacao,fxi,alim);

% OBS: testar se nao otimizou a BL testa individuo aleatorio.
if (fitOld == fxi(1))
    
    % busca local por ciclos
    [populacao, fxi] = buscaLocalClusterCiclos(populacao,fxi,alim); 
 
end

end

function ind = getIndividuoAleatorio(populacao)

% retira elite
populacao = populacao(2:end,:);

% escolhe individuo aleatorio da populacao
vecAle = randperm(size(populacao,1));

ind = populacao(vecAle(1),:);

end

% encapsula busca local
function [populacao, fxi] = buscaLocalIndAleatorio(populacao,fxi,alim)

% obtem individuo aleatorio (que nao seja o elite)
individuo = getIndividuoAleatorio(populacao);

% busca local PVT 
[populacao, fxi] = buscaLocalPvt(individuo, populacao,fxi,alim);

end

% encapsula busca local
function [populacao, fxi] = buscaLocalElite(populacao,fxi,alim)

% seleciona UM individuos p/ realizar busca local
individuo = selecionaIndividuoBuscaLocal(populacao,fxi,alim);

% busca local PVT 
[populacao, fxi] = buscaLocalPvt(individuo, populacao,fxi,alim);

end

% encapsula busca local
function [populacao, fxi] = buscaLocalPvt(individuo,populacao,fxi,alim)

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

