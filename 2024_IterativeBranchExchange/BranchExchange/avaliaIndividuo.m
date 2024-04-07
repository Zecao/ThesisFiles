%   Avalia funcao objetivo para cada individuo 
function [fitness, alim, results] = avaliaIndividuo(individuo, alim, forceRunMatpower )

results =[];

skip = alim.paramAG.skipDistFlowCluster;

% contador de avaliacoes das funcoes
global param

if( strcmp(alim.paramAG.PFtype, 'DistFlow') && ~ forceRunMatpower && (skip~=1))
    
    fitness = avaliaInd_DistFlow(alim) ;
    param.NCALBL = param.NCALBL + 1; 

else

    [ fitness, alim, results ] = avaliaIndividuoPvt(individuo, alim) ;
    param.NCAL = param.NCAL + 1;
    
end

end

function fitness = avaliaInd_DistFlow(alim) 

% TODO fix me
alimTest = alim;

lstArestasCiclo = alimTest.DistFlow.lstArestasCiclo_SemNA;
lstArestasLadoBE = alimTest.DistFlow.lstArestasLadoBE; 
lstArestasVerif = alimTest.DistFlow.lstArestasVerif;
% 
resultsRef = alimTest.DistFlow.resultsRef;

% exemplo rde 16 barras
% troca (st)s9(8-10) por (kl)s13(10-14))
% neste caso, como (st) eh do lado esquerdo Wii_L =-1

Vst = getTensaoFromResults(alimTest.DistFlow.novaTS,resultsRef);

Pst = abs(resultsRef.branch(alimTest.DistFlow.novaTS,14)); % OBS: abs nao existe na eq. original
Qst = abs(resultsRef.branch(alimTest.DistFlow.novaTS,15)); % OBS: abs nao existe na eq. original

% condicao de retorno
% se Pst == 0, o delta sera zero.
if (Pst==0)
    fitness = alim.DistFlow.fitRef -0.000001;
    return;
end

% obtem tensao
Vij = getTensaoFromResults(lstArestasCiclo,resultsRef);

Vst = mean(Vij);

% cria vector Wij
Wij = criaVecWij(lstArestasCiclo,lstArestasLadoBE,lstArestasVerif);

Rij = resultsRef.branch(lstArestasCiclo,3);

Pij = resultsRef.branch(lstArestasCiclo,14); 

Qij = resultsRef.branch(lstArestasCiclo,15);

sumProd_Pij = sum(Wij.*Rij.*abs(Pij)./(Vij.*Vij) ); % OBS: abs nao existe na eq. original % OBS:./(Vij.*Vij) 
sumProd_Qij = sum(Wij.*Rij.*abs(Qij)./(Vij.*Vij) ); % OBS: abs nao existe na eq. original
sumRij = sum(Rij);

% parte KL (resistencia ramo NA que sera fechado)
% OBS: comentei, pois Rkl jah vem no vetor Rij
% Rkl = resultsRef.branch(alimTest.DistFlow.oldTS,3);

% obtem delta
% OBS: a correcao de tensao sozinha (Vst^2) funcioan rede 33,70 e 136. Mas
% nao 84 barras
% (Rkl+sumRij)
delta_pu = 2*Pst*(sumProd_Pij) + 2*Qst*sumProd_Qij + sumRij*(Pst^2+Qst^2)/(Vst^2); 

% 
delta_S = delta_pu / alimTest.Sbase;

% tolerancia 1E-4
if ( abs(delta_S) < 0.00001 ) 
    delta_S = 0.00001;
end

% retorna fitness 
fitness = alim.DistFlow.fitRef + delta_S;

end

function tensao = getTensaoFromResults(lstArestasCiclo,resultsRef)

bus = resultsRef.branch(lstArestasCiclo,1);

tensao = resultsRef.bus(bus,8);

end

function Wij = criaVecWij(allArestasCiclo,arestasLadoBE,arestasVerif) 

Wij=[];

% atribui pesos conforme troca de ramos.
% De maneira mais simples, se o lado (lista de arestas) recebe o ramo, o peso deve ser = 1
% pois as perdas irão aumentar. Caso contrário, o peso = -1.
for i=1:size(allArestasCiclo,1)
    
    % verifica se aresta eh membro de arestaLadoBE
    if ( ismember(allArestasCiclo(i),arestasLadoBE) )        
        Wij(i,1) = -1; %1     
    else        
        Wij(i,1) = 1;   %-1 
    end
    
%     if ( ismember(allArestasCiclo(i),arestasVerif) )
%         Wij(i,1) = 0;   
%     end
    
end

end

% 
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
