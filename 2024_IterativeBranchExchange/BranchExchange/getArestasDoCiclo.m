% public getArestasDoCiclo
function arestas = getArestasDoCiclo(chave, alim)

% obtem nos (pai e filho) da chave
[noPai,noFilho] = getNos(chave,alim);

% cria alim sparse 
branchesSparse = criaSparseMBranch(alim);

% calcula o menor caminho (ciclo) entre as duas 
[d, pred] = shortest_paths(branchesSparse, noPai, struct('target',noFilho) );

% retorna arestas percorridas por SP
arestas = getArestas_MenorCaminho(d,pred,noFilho,alim);

% verifica se encontrou ciclo 
if ( isempty(arestas) )

    disp('List de arestas vazia!');
    arestas=chave;
    
end

% ordena
arestas = sort(arestas);

end
