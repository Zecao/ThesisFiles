% encapsula busca local
function [populacao, fxi] = buscaLocal(populacao,fxi,alim,geracao)

[populacao, fxi] = setupGeral(populacao,fxi,alim,geracao);

% OLD CODE manter
% 
% sis = getSistema(alim.Fnome);
% 
% switch (sis)
%        
%     case 6
% 
%         % PF:
%         [populacao, fxi] = setup417barras(populacao,fxi,alim,geracao);
%         
%     
%     otherwise  % busca local
%         
%         [populacao, fxi] = buscaLocalElite(populacao,fxi,alim);
%     
% end

end

% OLD CODE manter
% BL tamCiclo ou aleatorio. Se nao otimizou, tenta por Cluster.
function [populacao, fxi] = setupGeral(populacao,fxi,alim,geracao)

if (mod(geracao,2)==1)
    [populacao, fxi] = buscaLocalPvt(populacao,fxi,alim);
else
    % busca local por ciclos
    [populacao, fxi] = buscaLocalClusterCiclos(populacao,fxi,alim); 
end

end

% OLD CODE manter
% mecanismo de backtrack do Elite da geracao anterior.
% retorna Elite p/ 1a posicao
function [populacao, fxi] = backTrackElite(populacao,fxi)

fxi(1) = fxi(end);
populacao(1,:) = populacao(end,:);

fxi(end) = [];
populacao(end,:) = [];

end

% BL tamCiclo ou aleatorio. Se nao otimizou, tenta por Cluster.
function [populacao, fxi] = setup119barras(populacao,fxi,alim,geracao)

% OLD CODE manter
% % fitness Inicial
% fitOld = fxi(1);
% eliteGer = populacao(1,:);
% 
% [populacao, fxi] = buscaLocalPvt(populacao,fxi,alim);
% 
% % OBS: testar se nao otimizou a BL testa individuo aleatorio.
% if (fitOld == fxi(1))
%     
%     % backtrack Elite
%     [populacao, fxi] = backTrackElite(populacao,fxi);
% 
%     % busca local por ciclos
%     [populacao, fxi] = buscaLocalClusterCiclos(populacao,fxi,alim); 
%     
% end
% 
% % guarda elite da geracao na poulacao.
% % fitness Inicial
% fxi(end) = fitOld;
% populacao(end,:) = eliteGer;

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
[populacao, fxi] = buscaLocalInd(individuo, populacao,fxi,alim);

end