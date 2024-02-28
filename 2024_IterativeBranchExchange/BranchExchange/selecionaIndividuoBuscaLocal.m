% seleciona 1 individuo p/ busca local 
function [individuo, indFxi] = selecionaIndividuoBuscaLocal(populacao,fxi,alim)

global param;
    
% % seleciona individuos diferentes
[popDiv, indSupP] = unique(populacao, 'rows');

% % OLD CODE && TODO FIX 
% % verificacao da diversidade populacional
% if ( size(popDiv,1) == 1 )  %&& alim.paramAG.tamPopulacao ~= 1 ) 
%     
%     disp('Todos individuos da Populacao são Iguais!');
%     
%     % retorna unico individuo
%     individuo = populacao(1,:);
%     indFxi = fxi(1);
% 
%     % seta variavel global para abortar
%     param.Abortar = 1;
%     
%     return;
%     
% end

% analisa todos os membros da populacao
for i=1:size(populacao,1)  
    
    % obtem individuo e fitness
    individuo = populacao(i,:);
    indFxi = fxi(i);
    
    % se analisou, continua indo p/ proximo
    if (getStatusBuscaLocalInd(individuo,alim))
        continue;
    else
        return; % retornando o individuo
    end
        
end

% obtem individuo e fitness
individuo = populacao(1,:);
indFxi = fxi(1);

end