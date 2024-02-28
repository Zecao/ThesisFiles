% abre chave TS 
function alim = abreChaveTS(alim,chave)

% verifica tamanho chave 
if ( length(chave) > 1 )

    % mensagem de erro
    disp('Erro tamanho chave!')
    
end

% 2024 versao p/ alim reduzido
ind = find(alim.FmChavesIEEE(:,1)==chave);

% desliga chave interconexao (retira laco)
alim.FmBranch(ind,11) = 0;

end