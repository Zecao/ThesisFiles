% retorna indices das arestas com info do menor caminho
function indArestas = getArestas_MenorCaminho(d,pred,noInicial,alim)

% init vars
indArestas = [];

% DO 
% getChavePorNos
proxNo = pred(noInicial);

% condicao de retorno
if (proxNo==0)
    return;
end

arestas = getChavePorNos(noInicial,proxNo,alim);
indArestas = [indArestas; arestas];

distancia = d(noInicial);
noInicial = proxNo;

% enquanto distancia noPai/noFilho nao chegar a 0
% OBS: a distancia pode ser Inf, por isto necessario checar.
while (distancia ~= 0)&&(distancia ~= Inf)
    
    proxNo = pred(noInicial);
    % OBS: a aresta pode vir vazia, caso seja a aresta de interligacao de
    % geradores
    
    % condicao de retorno
    if (proxNo==0)
        return;
    end

    arestas = getChavePorNos(noInicial,proxNo,alim);    
    indArestas = [indArestas; arestas];
    
    % atualiza contadores
    distancia = d(proxNo);
    noInicial = proxNo;
end

% ordena p/ faciliar(acertar?) indexacao
indArestas = sort(indArestas);

end