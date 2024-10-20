% verifica e corrige radialidade
function radialBool = verificaRadialidadeBGL(alim,populacao)

global param;

% init vars
radialBool = zeros( size(populacao,1), 1);

for i=1:size(populacao,1)
        
    radial  = testaRadialidadeBGL(alim,populacao(i,:));
    
    radialBool(i) =  radial;
     
    param.contTestesRadialidade = param.contTestesRadialidade + 1;
end

% converte radialBool p/ logical
radialBool = logical(radialBool);

end

% testa Radialidade atraves da BGL
function radial = testaRadialidadeBGL(alim,individuo)

% seta bool
radial = false;
arvoreKruskal = [];

% OBS: deve vir antes de setar individuo corrente 
alim = setaBranchsAtivos(alim,individuo);   

% cria matriz sparse mBranch original
branches = criaSparseMBranch(alim);

% % DEBUG 
% numArestasBranchsDEBUG = num_edges(branches);

% verifica se todos os nos estao energizados
energizado = verificaNos(branches,alim);

% se todos nos neergizado, verifica anel 
if (energizado)    
    
    % numero de arestas grafo
    numArestasBranchs = num_edges(branches);

    % calcula arvore Kruskal
    arvoreKruskal = kruskal_mst(branches);

    % numero de arestas arvore de kruskal
    numArestasKruskal = num_edges(arvoreKruskal);

    % grafo eh radial?
    radial = numArestasBranchs == numArestasKruskal;
        
end

% DEBUG
% adiciona aresta
% branches = addEdge(branches,alim,individuo);

% DEBUG
% deleta edge
% branches(8,10) = 0;
% branches(10,8) = 0;

% % DEBUG
% plotaArvore(treeVec);

end

% DFS Compute the depth first search times.
%
% [d dt ft pred] = dfs(A,u) returns the distance (d), the discover (dt) and
% finish time (ft) for each vertex in the graph in a depth first search 
% starting from vertex u.
%   d = dt(i) = ft(i) = -1 if vertex i is not reachable from u
% pred is the predecessor array.  pred(i) = 0 if vertex (i)  
% is in a component not reachable from u and i != u.

% verifica se todos os nos estao acessiveis
function [energizado] = verificaNos(branches,alim)

% bool
energizado = true;

% obtem nos raizes
nosRaizes = getNoRaizes(alim); 

% realiza DFS p/ verificar se todos sao energizados
[distDFS, dt ft pred] = dfs(branches,nosRaizes(1));

% % 2024
% radial = verificaBackEdges(distDFS);

% % OLD CODE MANTER
% % OBS: esta funcao garante o funcionamento da DFS em alimReduzidos ao filtrar
% % do vetor de nos existentes aqueles que normalmente nao seriam alcançados (e.g. 
% % uma ilha)
% nosVisitados = filtraBarrasNaoExistentes(nosVisitados,alim);

% verifica se algum no nao foi acessivel
ind = find ( distDFS == -1 );

if ( ind )
    
    energizado = false;
    
end

end

% TODO
% 2024
function radial = verificaBackEdges(nosVisitados)

radial=0;

end


% OBS: esta funcao garante o funcionamento da DFS em alimReduzidos ao filtrar
% do vetor de nos existentes aqueles que normalmente nao seriam alcançados (e.g. 
% uma ilha)

% TODO: tentar otimizar, devido a baixo desempenho
% filtra barras nao existentes no vetor de nos visitados
function profNos = filtraBarrasNaoExistentes(profNos,alim)

busId = alim.FmBus(:,1);

barrasExistentes = false(size(profNos,1),1);

% preenche vetor barrasExistentes. 
for i=busId'
    
    barrasExistentes(i) = true;
    
end

profNos = profNos(barrasExistentes);

end

%
function plotaArvore(treeVec)

treeplot(treeVec);
count = size(treeVec,2);
[x,y] = treelayout(treeVec);
x = x';
y = y';
name1 = cellstr(num2str((1:count)'));
text(x(:,1), y(:,1), name1, 'VerticalAlignment','bottom','HorizontalAlignment','right')
title({'Level Lines'},'FontSize',12,'FontName','Times New Roman');

end

% DEBUG
function branches = addEdge(branches,alim,individuo)

%chaves
chaves = alim.FmChavesIEEE();

%obtem individuo origial 
indOriginal = logical(chaves2individuo(chaves));

% obtem diferenca entre ramos. -1: fechar a chave / 1:abrir 
% ramosDif = indOriginal - logical(individuo);

% DEBUG
ramosDif = logical(individuo) - getIndividuoFechado(1);

indice = 1;

for i= ramosDif
     
    % -1: fechar a chave
    if (i == -1)
        
        % nova aresta 
        chaves(indice,6) = 1;
        
        x = chaves(indice,2);
        y = chaves(indice,3);
        
        % adiciona edge ao grafo da matriz
        branches(x,y) = 1;
        branches(y,x) = 1;
        
        % DEBUG (que adiciona soh um laco) 
        break; 
        
    % 1:abrir  
    elseif (i == 1)
        
        % nova aresta 
        chaves(indice,6) = 1;
                        
    end
    
    indice = indice + 1;
    
end

end