% obtem nos (pai e filho) de um indice da matriz branch
function [noPai,noFilho] = getNos(arestaChave,alim)

% 2024
indChave = find(alim.FmChavesIEEE(:,1)==arestaChave);

noPai = alim.FmBranch(indChave,1);
noFilho = alim.FmBranch(indChave,2);

end