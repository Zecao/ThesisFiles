% obtem Chave Menor Perda por descida coordenada
function chaveMenorPerda = getChaveMenorPerdaCiclo_BE( tieSwitch, alimOri)

% lado que ira fazer a BE
lado = alimOri.paramAG.ladoCicloBE; % = 'maiorQueda';

% OLD CODE mante
% % modo alim. reduzido
% if( strcmp(alimOri.paramAG.PFtype, 'AlimReduzido') )      
%     [alimOri,fitRef] = modoAlimReduzido(tieSwitch,indArestasDoCiclo,alimOri);
% end
    
% avalia individuo OBS: fluxo Matpower
[ fitRef, alimOri, results ] = avaliaPopulacao(getIndividuoCorrente(alimOri), alimOri, 1);

if (strcmp(lado,'maiorQueda'))
    % BE para lado de maior queda de tensao
    chaveMenorPerda = obtemChaveMenorPerda_Tensao(tieSwitch,alimOri,fitRef,results);
else
    % nao testa a tensao
    chaveMenorPerda = obtemChaveMenorPerdaCaminhaRede(tieSwitch,alimOri,fitRef,results);
end

% % TODO Nao da bons resultados
% % obtem chave demenor perda por menor corrente
% chaveMenorPerda = obtemChaveMenorPerdaPorMenorCorrente(indArestasDoCiclo, tieSwitch,alimOriginal);

end

% caminha em direcao ao Pai, enquanto fitness estiver diminuindo
function chaveNAmenorPerda = caminhaEnquantoFitnessDiminuir_2024(noInicial,tieSwitch,fitRef,alim,resultsRef)

chaveNAmenorPerda = tieSwitch; % caso nao encontre nenhuma TS melhor, retorna a TS antiga

noPai = alim.FbarraIdCab;

grafConectividade = criaSparseMBranch(alim);

% calcula o menor caminho (ciclo) entre o noInicial e cabeca 
[d, pred] = shortest_paths(grafConectividade, noPai, struct('target',noInicial) );

% 1a iteracao. DO  caminha rede
proxNo = caminhaRede_2024(noInicial,pred);

% lst TODAS (inclui TS) arestas do ciclo
% OBS: 
lstTodasArestasCiclo = getAllArestasCiclo(tieSwitch,alim);

if ((tieSwitch == 28)) %||(tieSwitch == 155)% r136 53 139  % rede 84b (tieSwitch == 63)||((tieSwitch == 84)&&(novaNA==55)) %&&(novaNA==32) %(tieSwitch == 8)
    debug = 0;
end

% OLD CODE DEL
% [lstArestasLadoBE, lstArestasOLado] = defLadoBE(tieSwitch,noInicial,lstTodasArestasCiclo,alim,pred);
% lstArestasLadoBE = lstArestasLadoBE2;
% lstArestasOLado = lstArestasOLado2;

% TODO mover p/ if
[lstArestasLadoBE, lstArestasOLado] = defLadoBE(tieSwitch,noInicial,lstTodasArestasCiclo,alim,pred);

% DO 
% obtem chave (indice aresta) por meio dos nos pais e filhos.
novaNA = getChavePorNos(proxNo,noInicial,alim);

% OBS: faz 1 unica vez!
% atualiza struct DistFlow 
if ( strcmp(alim.paramAG.PFtype, 'DistFlow') )

    alim.DistFlow.fitRef = fitRef; % fitness referencia (antes da manobra)
    alim.DistFlow.resultsRef = resultsRef; % results PF Matpower  
    alim.DistFlow.oldTS = chaveNAmenorPerda; % chaveNA inicial (que sera fechada)
    
    % OBS: NAO 
%     alim.DistFlow.lstArestasCiclo_SemNA = removeLst(chaveNAmenorPerda,lstTodasArestasCiclo);
    alim.DistFlow.lstArestasCiclo_SemNA = lstTodasArestasCiclo;
    alim.DistFlow.lstArestasLadoBE = lstArestasLadoBE; 
end

lstArestasVerif =[];

% enquanto fitness diminuir
while (  proxNo ~= 0 )   % ~isempty(proxNo) 
    
    % atualiza struct DistFlow 
    if ( strcmp(alim.paramAG.PFtype, 'DistFlow') )
        
        alim.DistFlow.lstArestasLadoBE = lstArestasLadoBE; 
        alim.DistFlow.lstArestasVerif = lstArestasVerif;
        alim.DistFlow.noInicial = noInicial; % proxNo BE               
        alim.DistFlow.novaTS = novaNA; % novaTS (que sera aberta)    

    end  

    % TODO 
    % ### Manobra (utilizado em fluxo completo)
    % fecha chaveNA atual
    alim = fechaChaveTS(alim,chaveNAmenorPerda);

    % abre nova chave TS 
    alim = abreChaveTS(alim,novaNA);   
    
    if ((tieSwitch == 93)&&(novaNA==36))
%         plotaGrafo(alim);
        debug = 0;
    end
   
    % avalia individuo
    [ novaFitness, alim ] = avaliaPopulacao( getIndividuoCorrente(alim), alim, 0);

    % se novaFitness eh menor que fitness referencia, continua caminhando.
    % OBS1: <= eh necessario p/ 'DistFlow' && rede 70, devido a resultados prox.
    % OBS2: ( round(novaFitness,8) < round(fitRef,8) + 0.00000001)  OBS2: % round(,8) nao funciona rede 33 barras

    if ( novaFitness < fitRef )        

        % atualiza chaveTSmenorPerda
        chaveNAmenorPerda = novaNA;      
        
%       % atualiza fitness de referencia
        fitRef = novaFitness;
        
%         % OLD CODE MANTER
%         % remove novaTS da lista de arestas ladoBE 
         % removeLst(novaNA,lstArestasLadoBE);
        
        % atualiza o noInicial armazenando o proxNo para poder atualizar o proxNo.
        noInicial = proxNo;       
        
        % caminha rede
        proxNo = caminhaRede_2024(noInicial,pred); 
        
        if (proxNo==0)
           break; 
        end
        
        % obtem chave (indice aresta) por meio dos nos pais e filhos.
        novaNA = getChavePorNos(proxNo,noInicial,alim);

    else        

        % break, retornando a chaveTSmenorPerda
        break;
        
    end
    
end

end

% obtem chave menor perda, caminhando p/ os 2 lados da resde 
function novaTieSwitch = obtemChaveMenorPerda_Tensao(tieSwitch,alimOriginal,fitRef,results)

% obtem nos 
[noEsquerdo,noDireito] = getNos(tieSwitch,alimOriginal);

v1 = getTensaoNo(noEsquerdo,results);
v2 = getTensaoNo(noDireito,results);

% caminha no sentido da menor tensao
if (v1<v2)
    primeiroNo = noEsquerdo;
    segundoNo = noDireito;
else
    primeiroNo = noDireito;
    segundoNo = noEsquerdo;
end  

% caminha em direcao ao Pai, enquanto fitness estiver diminuindo
novaTieSwitch = caminhaEnquantoFitnessDiminuir_2024(primeiroNo,tieSwitch,fitRef,alimOriginal,results);

if ( novaTieSwitch == tieSwitch )

    % caminha em direcao ao Pai, enquanto fitness estiver diminuindo
    novaTieSwitch = caminhaEnquantoFitnessDiminuir_2024(segundoNo,tieSwitch,fitRef,alimOriginal,results);
    
end

end

% divide as arestas do ciclo em 2 grupos: 'ladoBE' e 'outroLado'
% 'ladoBE' sao as arestas que a BE sera realizada (definido pelo noInicial da chave)
% a BE funcionando, uma das arestas do 'ladoBE' sera aberta, deste modo na
% definicao de pesos do DistFlow, o ladoBE recebera W=-1 pois esta
% diminuindo (portanto diminuindo perdas).
% jah o outroLado recebera peso W=1 porque aumentara (recebendo arestas das
% chaves NA).
% EX: troca NA53-NF55. 
% 53 deve entrar em lstAOutroLado (peso=1)
% 55 deve sair de lstALadoBE (peso=-1)
function [lstArestasLadoBE, lstArestasOutroLado] = defLadoBE(tieSwitch,noInicial,lstTodasArestasCiclo,alim,pred)

% 
[no1,no2] = getNos(tieSwitch,alim);

% se no1 == noInicial, obtem arestasLadoBE e arestasOutroLado
if (no1==noInicial)
    
    [lstArestasLadoBE, lstArestasOutroLado] = getArestasLadoBE_outro(noInicial,no2, alim, lstTodasArestasCiclo);  

    % se não (noInicial==no2)
else
    
    [lstArestasLadoBE, lstArestasOutroLado] = getArestasLadoBE_outro(noInicial,no1, alim, lstTodasArestasCiclo);  
end

% % adiciona TS no outro lado 
% lstArestasOutroLado = [lstArestasOutroLado; tieSwitch];
lstArestasLadoBE = [lstArestasLadoBE; tieSwitch];

% % % obtem novaNA
% proxNo = caminhaRede_2024(noInicial,pred);
% novaNA = getChavePorNos(proxNo,noInicial,alim);
% 
% % ajusta renomeando as listas de acordo com a chave NA. 
% % se novaNA eh membro do outroLado, ajusta listas como abaixo
% if (ismember(novaNA,lstArestasLadoBE))
%     
%     % swap novaNA
%     lstArestasLadoBE = removeLst(novaNA,lstArestasLadoBE);    
%     lstArestasOutroLado = [lstArestasOutroLado; tieSwitch];
% 
% % se nao
% else
%    
%     % swap novaNA
%     lstArestasOutroLado = removeLst(novaNA,lstArestasOutroLado);    
%     lstArestasLadoBE = [lstArestasLadoBE; tieSwitch];
% 
% end

end


function [lstALadoBE, lstAOutroLado] = defLadoBE_BAK(tieSwitch,noInicial,lstTodasArestasCiclo,alim,pred)

% 
[no1,no2] = getNos(tieSwitch,alim);

% obtem lsts arestas
if (no1==noInicial)
    [lstALadoBE, lstAOutroLado] = getArestasLadoBE_outro(noInicial,no2, alim, lstTodasArestasCiclo);  
else
    [lstALadoBE, lstAOutroLado] = getArestasLadoBE_outro(no1,noInicial, alim, lstTodasArestasCiclo);  
end

% % obtem novaNA
proxNo = caminhaRede_2024(noInicial,pred);
novaNA = getChavePorNos(proxNo,noInicial,alim);

% BAK
% se novaNA eh membro do outroLado, ajusta listas como abaixo
if (ismember(novaNA,lstAOutroLado))
    
    % swap novaNA
    lstAOutroLado = removeLst(novaNA,lstAOutroLado);    
    lstALadoBE = [lstALadoBE; tieSwitch];

% se nao
else
   
    % swap novaNA
    lstALadoBE = removeLst(novaNA,lstALadoBE);    
    lstAOutroLado = [lstAOutroLado; tieSwitch];
    
    % neste caso, devemos inverter as listas 
    tmp = lstALadoBE;
    lstALadoBE = lstAOutroLado;
    lstAOutroLado = tmp;
    
end

end


function [lstArestasLadoBE, lstArestasOLado] = getArestasLadoBE_outro(noLadoBE, noOutroLado, alim, lstTodasArestasCiclo)

noPai = alim.FbarraIdCab;
grafConectividade = criaSparseMBranch(alim);

% arestas lado 1
[d, pred] = shortest_paths(grafConectividade, noPai, struct('target',noLadoBE) );
% verticesLado1 = getVertices_MenorCaminho(d,pred,noE1);
lstArestasLadoBE = getArestas_MenorCaminho(d,pred,noLadoBE,alim); 
lstArestasLadoBE = intersect(lstArestasLadoBE,lstTodasArestasCiclo);

% arestas lado 2
[d, pred] = shortest_paths(grafConectividade, noPai, struct('target',noOutroLado) );
% verticesLado2 = getVertices_MenorCaminho(d,pred,noD1);
lstArestasOLado = getArestas_MenorCaminho(d,pred,noOutroLado,alim); 
lstArestasOLado = intersect(lstArestasOLado,lstTodasArestasCiclo);  

% % DEBUG 
% % verifica se a uniao dos 2 lados eh igual a lstTodasArestasCiclo
% c = union(lstArestasLadoBE,lstArestasOLado);
% d = setdiff(lstTodasArestasCiclo,c);

end

% obtem todas as arestas do ciclo.
function arestas = getAllArestasCiclo(chave,alim)

arestas = getArestasDoCiclo(chave, alim);
arestas = [chave; arestas]; 

arestas = sort(arestas);

end

% OLD CODE manter
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
function novaTieSwitch = obtemChaveMenorPerdaCaminhaRede(tieSwitch,alimOriginal,fitRef,results)

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
novaTieSwitch = caminhaEnquantoFitnessDiminuir_2024(primNo,tieSwitch,fitRef,alimOriginal,results);

% senao encontrou chave menor perda, caminha no sentido do filho
if ( novaTieSwitch == tieSwitch )
    
    % caminha em direcao ao Pai, enquanto fitness estiver diminuindo
    novaTieSwitch = caminhaEnquantoFitnessDiminuir_2024(segNo,tieSwitch,fitRef,alimOriginal,results);
    
end

end

% caminha rede 
function proxNo = caminhaRede_2024(no,pred)

proxNo = pred(no);

end

function [alim,fitRef,sparseCiclo] = modoAlimReduzido(tieSwitch,indArestasDoCiclo,alim)

% substitui alimOriginal por alim. reduzido 
alim  = criaAlimReduzido(tieSwitch,indArestasDoCiclo,alim);    

% nova fitness Ref. eh a do alim. reduzido. 
[ fitRef, alim2, results ] = avaliaPopulacao(getIndividuoCorrente(alim), alim, 0);  

% cria matriz sparsa do Ciclo   
sparseCiclo = criaSparseMBranch(alim);

end