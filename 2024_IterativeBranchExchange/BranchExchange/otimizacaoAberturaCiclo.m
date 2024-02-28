% obtem laco formado pela chave(interconexao) p/ o individuo fornecido
function [chaveMP] = otimizacaoAberturaCiclo(chave, indBin, alim)

% seta individuo corrente 
alim = setaBranchsAtivos(alim,indBin);   

% get arestas do ciclo 
indArestasDoCiclo = getArestasDoCiclo(chave, alim);

% condicao de retorno
if (chave == indArestasDoCiclo) % OLD CODE (isempty(indArestasDoCiclo))
    chaveMP = chave;
else
    % obtem Chave Menor Perda
    chaveMP = getChaveMenorPerdaCiclo_BE(chave, alim, indArestasDoCiclo);
end

end