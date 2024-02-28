% correcao de lacos da populacao
function [novosIndividuos, newFxi] = buscaLocalBranchExchange(indBin, alim)

% init vars
newFxi = [];

% chama otimiza ciclo
novosIndividuos = otimizaCicloInd(indBin,alim);

% se criou novos individuos 
if ( ~isempty(novosIndividuos) )

    % introduz todos os individuos na POP ORIGINAL
    % avalia populacao
    newFxi = avaliaPopulacao(novosIndividuos, alim, 1);    

    % seta status de BuscaLocal do individuo p/ true 
    setStatusBuscaLocalInd(indBin,alim);

end

end

% correcao de lacos
% retorna lista de individuos com ciclos 
function lstIndividuos = otimizaCicloInd(indBin,alim)

% transforma binario p/ TS 
indTS = binario2tieSwitch(indBin,alim);

% heuristica close-all
if(alim.paramAG.closeAll == 1)
    % OLD CODE
    lstIndividuos = otmCicloComOutrasChavesFechadas(indTS,indBin,alim);
else
    % 2024
    lstIndividuos = otimizaCicloIndividuo(indTS,indBin,alim);
end

% transforma p/ binario
lstIndividuos = tieSwitch2binario(lstIndividuos,alim);

% verifica radialidade dos novos individuos
radial = verificaRadialidadeBGL(alim, lstIndividuos);

% retorna somente os individuos radiais
lstIndividuos = lstIndividuos(radial,:);

end

% OBS: NAO USADA.
% correcao de lacos com outras chaves fechadas 
function [lstIndividuos] = otmCicloComOutrasChavesFechadas(indTS,indBinOriginal,alim)

% escolhe ordem de otimizacao das chaves
indTS = defineOrdemDeCiclosOtm(indTS,indBinOriginal,alim);

% vetor que guarda info se TS foi otimizada
otimizouTS(indTS) = 0;

% cria lista de individuos do tamanho do numero de TS (ciclos). 
lstIndividuos = zeros( size(indTS,2),size(indTS,2)  );

% atribui novoIndividuo TS atual 
novoInd = indTS;

% fecha todas as chaves NAs
indBinOriginal(:)=1;

% numero de TS
for i=1:size(indTS,2)

    global param;
    debug = param.NCALBL;
    
    % abre chave NA
    indBinOriginal(indTS(i))=0;
    
    % obtem a chave da condicao de menor perda p/ dada chave indTS(i)
    chaveMP = otimizacaoAberturaCiclo(indTS(i), indBinOriginal, alim);
    
    % se nao membro do indTS (isto eh foi alterada)
    if ( ~ismember(chaveMP,indTS) )  
        
        % OBS: desempenho piora se comentar
        % altera indBin (para analise da proximo ciclo)
        indBinOriginal(indTS(i)) = 1;
        indBinOriginal(chaveMP) = 0;
        
        % atribui chave ao novo individuo     
        novoInd(i) = chaveMP;
    
    end    

    % lstIndividuos
    lstIndividuos(i,:) = novoInd;
    
end

% filtra lstIndividuos
lstIndividuos = unique(lstIndividuos, 'rows');
    
end
