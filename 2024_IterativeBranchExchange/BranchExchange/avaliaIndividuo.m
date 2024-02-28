%   Avalia funcao objetivo para cada individuo 
function [fitness, alim, results] = avaliaIndividuo(individuo, alim, forceRunMatpower )

% contador de avaliacoes das funcoes
global param

if( strcmp(alim.paramAG.PFtype, 'DistFlow') && ~ forceRunMatpower )

    [ fitness, alim, results ] = avaliaInd_DistFlow(individuo, alim) ;
    param.NCALBL = param.NCALBL + 1; 

else

    [ fitness, alim, results ] = avaliaIndividuoPvt(individuo, alim) ;
    param.NCAL = param.NCAL + 1;
    
end

end

function [ fitness, alim, results ] = avaliaInd_DistFlow(individuo, alim) 

% OLD CODE 
%     % obtem chave (indice aresta) por meio dos nos pais e filhos.
%     novaTS = getChavePorNos(proxNo,noInicial,alimManob);

% % obtem nos
% [oldNo1,oldNo2] = getNos(alimTest.DistFlow.oldTS,alimTest);

% [d1, pred1] = shortest_paths(branchesSparse, alim.FbarraIdCab, struct('target',no1) );
% indArestas1 = getArestas_MenorCaminho(d1,pred1,no1,alim)
% 
% arestasOutroLado = setdiff(allArestasCiclo,arestasLadoBE);
    % obtem chave (indice aresta) por meio dos nos pais e filhos.

results=[];
alimTest = alim;

% % % desmanobra. OBS: o alim vem manobrado eh necessario verificar se jah foi
% % % calculado (caso a funcao recebesse o alim NAO manobrado, o fluxo nao
% % % seria executado (devido ao hash de execucao). 
% % alimTest = fechaChaveTS(alimTest,alimTest.DistFlow.novaTS);
% % alimTest = abreChaveTS(alimTest,alimTest.DistFlow.oldTS);

% % obtem arestas lado BE (direito ou esquerdo), cujo w = -1
% d = alimTest.DistFlow.d; % vetor distancia
% pred = alimTest.DistFlow.pred; % listas nos predecessores    


% % Obtem Arestas ddo lado da BE.
% % cria matriz sparsa do Ciclo OBS: alim ja manobrado  
% sparseCiclo = criaSparseMBranch(alimTest);
% noInicial = alimTest.DistFlow.noInicial;

% % calcula o menor caminho (ciclo) entre o noInicial e cabeca 
% [d, pred] = shortest_paths(sparseCiclo, alimTest.FbarraIdCab, struct('target',noInicial) );
% 
% arestasLadoBE = getArestas_MenorCaminho(d,pred,noInicial,alimTest);
% 
% % obtem todas arestas, pela chave NA (inicial).
% allArestasCiclo = getArestasDoCiclo(alimTest.DistFlow.oldTS, alimTest);

lstArestasCiclo = alimTest.DistFlow.lstTodasArestasCiclo;
lstArestasLadoBE = alimTest.DistFlow.lstArestasLadoBE; 

% remove oldTS da ciclo
lstArestasCiclo = removeLst(alimTest.DistFlow.oldTS,lstArestasCiclo);

% 
resultsRef = alimTest.DistFlow.resultsRef;

% ptot = ptot + sg*dem(l,2)*dem(l,3)*abs(Pji(sai,l))*r(iadj(i,j))*W(i,j)*abs(Pji(lin,l));
% qtot = qtot + sg*dem(l,2)*dem(l,3)*abs(Qji(sai,l))*r(iadj(i,j))*W(i,j)*abs(Qji(lin,l));

% exemplo rde 16 barras
% troca (st)s9(8-10) por (kl)s13(10-14))
% neste caso, como (st) eh do lado esquerdo Wii_L =-1

Pst = resultsRef.branch(alimTest.DistFlow.novaTS,14)/alimTest.Sbase;
Qst = resultsRef.branch(alimTest.DistFlow.novaTS,15)/alimTest.Sbase;

% cria vector Wij
Wij = criaVecWij(lstArestasCiclo,lstArestasLadoBE);

Rij = resultsRef.branch(lstArestasCiclo,3);

Pij = resultsRef.branch(lstArestasCiclo,14)/alimTest.Sbase;

Qij = resultsRef.branch(lstArestasCiclo,15)/alimTest.Sbase;

sumProd_Pij = sum(Wij.*Rij.*Pij);
sumProd_Qij = sum(Wij.*Rij.*Qij);

% parte KL (resistencia ramo NA que sera fechado)
Rkl = resultsRef.branch(alimTest.DistFlow.oldTS,3);

% obtem delta
delta_pu = 2*Pst*(sumProd_Pij) + 2*Qst*sumProd_Qij + (Rkl+sum(Rij))*(Pst^2+Qst^2);

% 
delta_S = delta_pu * alimTest.Sbase;

% atualiza fitness 
fitness = alim.DistFlow.fitRef + delta_S;

end

function Wij = criaVecWij(allArestasCiclo,arestasLadoBE)

Wij=[];

for i=1:size(allArestasCiclo,1)
    
    % verifica 
    if ( ismember(allArestasCiclo(i),arestasLadoBE) )
        
        Wij(i,1) = -1;
        
    else
        
        Wij(i,1) = 1;
    end 
    
end

end


function [ fitness, alim, results ] = avaliaIndividuoPvt(individuo, alim) 

global param

% inicio codigo especifico FluxoPotencia
if ( strcmp (alim.funcao, 'fluxo') )

%     % cria nome do alimentador manobrado
    strAlim = strcat('Individuo',num2str(param.NCAL));

    % configura Branchs de acordo com chaves
    alim = setaBranchsAtivos(alim,individuo);
    
    % roda fluxo
	[ results, fitness ] = rodaFluxoPotencia(strAlim, alim);
    
    % seta bool status avaliacao individuo
    alim = setStatusAvaliacaoInd(individuo,fitness,results,alim);
    
% inicio codigo
else
        
    fitness  = feval(alim.funcao, individuo);
    
end

end
