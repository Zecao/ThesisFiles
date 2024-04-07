% obtem laco formado pela chave(interconexao) p/ o individuo fornecido
function [chaveMP] = otimizacaoAberturaCiclo(chave, indBin, alim)

% % seta individuo corrente 
% alim = setaBranchsAtivos(alim,indBin);   
% 
% % get arestas do ciclo 
% indArestasDoCiclo = getArestasDoCiclo(chave, alim);
% 
% % condicao de retorno
% if (chave == indArestasDoCiclo)
%     chaveMP = chave;
% else
%     % obtem Chave Menor Perda
%     chaveMP = getChaveMenorPerdaCiclo_BE(chave, alim, indArestasDoCiclo);
% end

% seta individuo corrente 
alim = setaBranchsAtivos(alim,indBin);   

% 2024
chaveMP = getChaveMenorPerdaCiclo_BE(chave, alim);

end