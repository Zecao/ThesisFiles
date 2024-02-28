% obtem Chave Menor Perda por descida coordenada
function chaveMenorPerda = getChaveMenorPerdaCiclo_BE( tieSwitch, alimOri, indArestasDoCiclo)

% lado que ira fazer a BE
lado = alimOri.paramAG.ladoCicloBE; % = 'maiorQueda';

% cria matriz sparsa do Ciclo   
sparseCiclo = criaSparseMBranch(alimOri);

% modo alim. reduzido
if( strcmp(alimOri.paramAG.PFtype, 'AlimReduzido') )
       
    [alimOri,sparseCiclo,fitRef] = modoAlimReduzido(tieSwitch,indArestasDoCiclo,alimOri);
    
else
    
    % obtem fitness de referencia para analise do ciclo
    ind = getIndividuoCorrente(alimOri);

    % OLD CODE nao da bons resultados
    
%     %   DEBUG
%     if (tieSwitch == 36)
%         plotaGrafo(alimOri);
%     end
    
% %     % distFlow 
%     if (strcmp(alimOri.paramAG.PFtype, 'DistFlow'))
%     
%        % close all TS 
%        alimOri = closeAll(alimOri);
%        
%        % 
%        alimOri = abreChaveTS(alimOri,tieSwitch);   
%        
%        % 
%        ind = getIndividuoCorrente(alimOri);
%        
%     end
    
    % avalia individuo
    [ fitRef, alimOri, results ] = avaliaPopulacao(ind, alimOri, 1);

end

if (strcmp(lado,'maiorQueda'))
    % BE para lado de maior queda de tensao
    chaveMenorPerda = obtemChaveMenorPerda_Tensao(sparseCiclo, tieSwitch,alimOri,fitRef,results);
else
    % nao testa a tensao
    chaveMenorPerda = obtemChaveMenorPerdaCaminhaRede(sparseCiclo, tieSwitch,alimOri,fitRef,results);
end

% % TODO Nao da bons resultados
% % obtem chave demenor perda por menor corrente
% chaveMenorPerda = obtemChaveMenorPerdaPorMenorCorrente(indArestasDoCiclo, tieSwitch,alimOriginal);

end

function [alim,sparseCiclo,fitRef] = modoAlimReduzido(tieSwitch,indArestasDoCiclo,alim)

% substitui alimOriginal por alim. reduzido 
alim  = criaAlimReduzido(tieSwitch,indArestasDoCiclo,alim);    

% nova fitness Ref. eh a do alim. reduzido. 
[ fitRef, alim2, results ] = avaliaPopulacao(getIndividuoCorrente(alim), alim, 0);  

% cria matriz sparsa do Ciclo   
sparseCiclo = criaSparseMBranch(alim);

end

function alim = closeAll(alim)

alim.FmBranch(:,11)=1;

end

% obtem chave menor perda, caminhando p/ os 2 lados da resde 
function novaTieSwitch = obtemChaveMenorPerda_Tensao(sparseCiclo,tieSwitch,alimOriginal,fitRef,results)

% obtem nos 
[noDireito,noEsquerdo] = getNos(tieSwitch,alimOriginal);

v1 = getTensaoNo(noDireito,results);
v2 = getTensaoNo(noEsquerdo,results);

% caminha no sentido da menor tensao
if (v1<v2)
    primeiroNo = noDireito;
    segundoNo = noEsquerdo;
else
    primeiroNo = noEsquerdo;
    segundoNo = noDireito;
end  

% caminha em direcao ao Pai, enquanto fitness estiver diminuindo
novaTieSwitch = caminhaEnquantoFitnessDiminuir_2024(primeiroNo,sparseCiclo,tieSwitch,fitRef,alimOriginal,results);

if ( novaTieSwitch == tieSwitch )

    % caminha em direcao ao Pai, enquanto fitness estiver diminuindo
    novaTieSwitch = caminhaEnquantoFitnessDiminuir_2024(segundoNo,sparseCiclo,tieSwitch,fitRef,alimOriginal,results);

end

end

% caminha em direcao ao Pai, enquanto fitness estiver diminuindo
function chaveTSmenorPerda = caminhaEnquantoFitnessDiminuir_2024(noInicial,grafConectividade,tieSwitch,fitRef,alim,resultsRef)

% init vars
lstNosVisitados =[];
chaveTSmenorPerda = tieSwitch; % caso nao encontre nenhuma TS melhor, retorna a TS antiga

noPai = alim.FbarraIdCab;

% calcula o menor caminho (ciclo) entre o noInicial e cabeca 
[d, pred] = shortest_paths(grafConectividade, noPai, struct('target',noInicial) );

% 1a iteracao. DO  caminha rede
[proxNo,lstNosVisitados] = caminhaRede_2024(noInicial,pred,lstNosVisitados);

% lst TODAS (inclui TS) arestas do ciclo
lstTodasArestasCiclo = getAllArestasCiclo(tieSwitch,alim);

% lst Aresta lado BE
lstArestasLadoBE = getArestas_MenorCaminho(d,pred,noInicial,alim);

% atualiza fitness p/ fitness do ciclo OBS: faz1 unica vez
if ( strcmp(alim.paramAG.PFtype, 'DistFlow') )

% TODO testar

%        % close all TS 
%        alimOri = closeAll(alimOri);
%        
%        % 
%        alimOri = abreChaveTS(alimOri,tieSwitch);   
%        
%        % 
%        ind = getIndividuoCorrente(alimOri);
    
    % calcula fitness do ciclo 
    % OBS: aqui pode haver 1 problema. Como o results nao eh
    % atrualizado com a BE DistFlow, a fitness de referencia sempre
    % sera a do ciclo calculado pelo ultimo FP Matpower.
    % OLD CODE
    % fitRef = calcFitnessCiclo(chaveTSmenorPerda,resultsRef,alim);
    
    alim.DistFlow.fitRef = fitRef; % fitness referencia (antes da manobra)
    alim.DistFlow.resultsRef = resultsRef; % results PF Matpower  
    alim.DistFlow.oldTS = chaveTSmenorPerda; % chaveNA inicial (que sera fechada) 
    alim.DistFlow.lstTodasArestasCiclo = lstTodasArestasCiclo;
    
end

% enquanto fitness diminuir
while (  proxNo ~= 0 )   % ~isempty(proxNo) 
    
    % obtem chave (indice aresta) por meio dos nos pais e filhos.
    novaTS = getChavePorNos(proxNo,noInicial,alim);
    if (isempty(novaTS))
        break;
    end
    
    % atualiza fitness p/ fitness do ciclo OBS: faz1 unica vez
    if ( strcmp(alim.paramAG.PFtype, 'DistFlow') )

        alim.DistFlow.noInicial = noInicial; % proxNo BE               
        alim.DistFlow.novaTS = novaTS; % novaTS (que sera aberta)        

        alim.DistFlow.lstArestasLadoBE = lstArestasLadoBE;    

    end

    % ### Manobra
    % abre nova chave TS 
    alim = fechaChaveTS(alim,chaveTSmenorPerda);

    % abre nova chave TS 
    alim = abreChaveTS(alim,novaTS);   
    
    %   DEBUG
    if (tieSwitch == 36)
        debug = 0;
    end
    
    % avalia individuo
    [ novaFitness, alim ] = avaliaPopulacao( getIndividuoCorrente(alim), alim, 0);

    % se novaFitness eh menor que fitness referencia, continua caminhando.
    if ( novaFitness < fitRef )
    
        % atualiza fitness de referencia
        fitRef = novaFitness;
        
        % atualiza chaveTSmenorPerda
        chaveTSmenorPerda = novaTS;        
        
        % atualiza o noInicial armazenando o proxNo para poder atualizar o proxNo.
        noInicial = proxNo;  
        
        % caminha rede
        [proxNo,lstNosVisitados] = caminhaRede_2024(noInicial,pred,lstNosVisitados); 

    else
                
        % break, retornando a chaveTSmenorPerda
        break;
        
    end
    
end

end


% obtem todas as arestas do ciclo.
function arestas = getAllArestasCiclo(chave,alim)

arestas = getArestasDoCiclo(chave, alim);
arestas = [chave; arestas]; 

arestas = sort(arestas);

end

% obtem finess do ciclo p/ o modo 'DistFlow'
function fitCiclo = calcFitnessCiclo(chaveTSmenorPerda,results,alim)

% arestas do ciclo
arestas = getArestasDoCiclo(chaveTSmenorPerda,alim);

Pto = results.branch(arestas,14);
Pfrom = results.branch(arestas,16);

fitCiclo = sum(Pto+Pfrom);

end

% obtem chave menor perda, caminhando p/ os 2 lados da resde 
function novaTieSwitch = obtemChaveMenorPerdaPorMenorCorrente(indArestasDoCiclo,tieSwitch,alimOriginal)

% obtem fitness de referencia para analise do ciclo
ind = getIndividuoCorrente(alimOriginal);

% fecha chave
ind(tieSwitch) = 1;

% avalia individuo
[ fitRef, alimOriginal, results ] = avaliaPopulacao(ind, alimOriginal, 0);

% 2023 novo codigo
P01 = results.branch(:,14);
P02 = results.branch(:,16); 
powerLoss = P01+P02;
resistencia = results.branch(:,3); 
iBranch = sqrt(powerLoss./resistencia);

iBranch2 = iBranch(indArestasDoCiclo);

% menor corrente
[current, indice ] = min(iBranch2);

% new TS 
novaTieSwitch = indArestasDoCiclo(indice);

end

% 
function tensao = getTensaoNo(no,results)

% 2024 esta versao funciona em alim. reduzidos
no = find(results.bus(:,1)==no);

tensao = results.bus(no,8);

% OLD CODE MANTER
% tensao = results.bus(no,8);

end

% obtem chave menor perda, caminhando p/ os 2 lados da rede 
function novaTieSwitch = obtemChaveMenorPerdaCaminhaRede(sparseCiclo,tieSwitch,alimOriginal,fitRef)

% obtem nos 
[noDireito,noEsquerdo] = getNos(tieSwitch,alimOriginal);

% gera inteiro aleatorio 
if (randi(2,1)==1)
   primNo = noDireito;
   segNo = noEsquerdo;
else
   primNo = noEsquerdo ;
   segNo = noDireito;
end

% caminha em direcao ao Pai, enquanto fitness estiver diminuindo
novaTieSwitch = caminhaEnquantoFitnessDiminuir_2024(primNo,sparseCiclo,tieSwitch,fitRef,alimOriginal);

% senao encontrou chave menor perda, caminha no sentido do filho
if ( novaTieSwitch == tieSwitch )
    
    % caminha em direcao ao Pai, enquanto fitness estiver diminuindo
    novaTieSwitch = caminhaEnquantoFitnessDiminuir_2024(segNo,sparseCiclo,tieSwitch,fitRef,alimOriginal);
    
end

end

% 2024 
% caminha rede 
function [proxNo,lstNosVisitados] = caminhaRede_2024(no,pred,lstNosVisitados)

lstNosVisitados = [lstNosVisitados; no];

proxNo = pred(no);

end

