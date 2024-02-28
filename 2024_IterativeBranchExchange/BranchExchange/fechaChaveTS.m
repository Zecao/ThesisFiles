% fecha chave TS 
function alim = fechaChaveTS(alim,chave)

% 2024 versao p/ alim reduzido
ind = find(alim.FmChavesIEEE(:,1)==chave);

% desliga chave interconexao (retira laco)
alim.FmBranch(ind,11) = 1;

end