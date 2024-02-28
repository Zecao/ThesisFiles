% cria alimentador reduzido p/ execucao FP no ciclo
function alimReduzido = criaAlimReduzido(tieSwitch,arestasDoCiclo,alimOriginal)

% 1
% adiciona TS nas arestas do ciclo
arestasDoCiclo = [arestasDoCiclo; tieSwitch];

% get Vertices do ciclo + TS
barras = getVerticesDoCiclo(tieSwitch,alimOriginal);

% 2 
% getArestas e getVertices da cabeca a 1 dos vertices da TS (e.g situacao rede 33-barras)

% cria alim sparse 
branchesSparse = criaSparseMBranch(alimOriginal);
[no1,no2] = getNos(tieSwitch,alimOriginal);

% calcula o menor caminho (ciclo) entre as duas 
[d, pred] = shortest_paths(branchesSparse, alimOriginal.FbarraIdCab, struct('target',no1) );

% retorna vertice
barras2 = getVertices_MenorCaminho(d,pred,no1);
arestas2 = getArestas_MenorCaminho(d,pred,no1,alimOriginal);

% uniao
arestasDoCiclo = union(arestasDoCiclo,arestas2);
barras = union(barras,barras2);

% cria alim reduzido
alimReduzido = criaAlimVazio();

alimReduzido.Ftipo = alimOriginal.Ftipo;
alimReduzido.Fnome = alimOriginal.Fnome;
alimReduzido.FbarraIdCab = alimOriginal.FbarraIdCab;
alimReduzido.Sbase = alimOriginal.Sbase;
alimReduzido.Vbase = alimOriginal.Vbase;
alimReduzido.paramAG = alimOriginal.paramAG;

% alimReduzido.FmBus = alimOriginal.FmBus(barras,:);
for i=1:size(barras,1)   
    indBarras = find(alimOriginal.FmBus(:,1)==barras(i));   
    alimReduzido.FmBus(i,:) = alimOriginal.FmBus(indBarras,:);    
end
% alimReduzido.FmBranch = alimOriginal.FmBranch(arestasDoCiclo,:);
% alimReduzido.FmChavesIEEE = alimOriginal.FmChavesIEEE(arestasDoCiclo,:);
for i=1:size(arestasDoCiclo,1)
    
    indChaves = find(alimOriginal.FmChavesIEEE(:,1)==arestasDoCiclo(i));

    alimReduzido.FmChavesIEEE(i,:) = alimOriginal.FmChavesIEEE(indChaves,:);
    alimReduzido.FmBranch(i,:) = alimOriginal.FmBranch(indChaves,:); 
end

% adiciona geradores 
barraGer = intersect(barras,alimOriginal.FmGerador(:,1)); % barras geradores
if (isempty(barraGer))
    Disp('Erro! Não encontrou gerador.');
end

for i=1:size(barraGer,1)
    
    % obtem indice do gerador
    indGer = find(alimOriginal.FmGerador(:,1)==barraGer(i));
    
    % atribui gerador 
    alimReduzido.FmGerador(i,:) = alimOriginal.FmGerador(indGer,:);
    
end

% cabeca
alimReduzido.FbarraIdCab = alimReduzido.FmGerador(1,1); % get first generator

% cria FmapVerticesArestas
alimReduzido = criaMapVerticesArestas_AlimRed(alimReduzido);

% DEBUG
% [ fitRef, alimOriginal, results ] = avaliaPopulacao(getIndividuoCorrente(alimReduzido), alimReduzido, 0);

end