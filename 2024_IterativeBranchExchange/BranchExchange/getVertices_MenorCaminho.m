% retorna indices das arestas do ciclo obtido com o fechamento de uma chave de interconexao
function vertices = getVertices_MenorCaminho(d,pred,noInicial)

vertices=[];

% do (while)
vertices = [vertices; noInicial];
distancia = d(noInicial);

% enquanto distancia noPai/noFilho nao chegar a 0
while (distancia ~= 0)

    noInicial = pred(noInicial);   
    
    if (noInicial==0)
        disp('Erro SP');
        break;
    end
    
    vertices = [vertices; noInicial];
    
    % atualiza dist
    distancia = d(noInicial);
    
end

end
