% obtem chave (indice aresta) por meio dos nos pais e filhos.
function chave = getChavePorNos(noPai,noFilho,alim)

% consulta map 
chave = alim.FmapVerticesArestas(noPai,noFilho);

chave = full(chave);

% OBS: ajuste aresta de interligacao de  geradores
% converte 0 p/ transforma para vazio
if (chave==0)
     chave=[];
end

end


