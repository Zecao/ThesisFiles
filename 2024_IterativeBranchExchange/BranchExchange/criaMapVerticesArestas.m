% cria matriz esparsa(map)
function alim = criaMapVerticesArestas(alim)

% 
arestas = alim.FmChavesIEEE(:,1);
MAX = max(union(alim.FmBranch(:,1),alim.FmBranch(:, 2))); 

matrixConectividade = sparse(MAX,MAX);

% TODO verificar unir p/ funcao unica criaMapVerticesArestas_AlimRed
for i=1:size(arestas,1);   
    
    vertice1 = alim.FmChavesIEEE(i,2);
    vertice2 = alim.FmChavesIEEE(i,3);

    matrixConectividade(vertice1,vertice2) = arestas(i);
    matrixConectividade(vertice2,vertice1) = arestas(i);
    
end

% for i=arestas'   
%     
%     vertice1 = alim.FmChavesIEEE(i,2);
%     vertice2 = alim.FmChavesIEEE(i,3);
% 
%     matrixConectividade(vertice1,vertice2) = i;
%     matrixConectividade(vertice2,vertice1) = i;
%     
% end

% DEBUG testando compatibildiade dos retornos % OK :)
% alim = criaMapVerticesArestas_OLD(alim);

% adioiona
alim.FmapVerticesArestas = matrixConectividade;

end