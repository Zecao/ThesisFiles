% correcao de lacos
function [lstIndividuos] = otimizaCicloIndividuo(indTS,indBinOriginal,alim)

lstIndividuos = otimizaCicloIndividuo2024(indTS,indBinOriginal,alim);

% OLD CODE testar antes de remover...
% lstIndividuos = otimizaCicloIndividuo2021(indTS,indBinOriginal,alim);

% lstIndividuos = otimizaCicloIndividuo2020(indTS,indBinOriginal,alim);

% lstIndividuos = otimizaCicloIndividuoPvp(indTS,indBinOriginal,alim);

end

% 
function lstIndividuos = otimizaCicloIndividuo2024(indTS,indBinOriginal,alim)

% escolhe ordem de otimizacao das chaves
indTS = defineOrdemDeCiclosOtm(indTS,indBinOriginal,alim);

% cria lista de individuos do tamanho do numero de TS (ciclos). 
lstIndividuos = zeros( size(indTS,2),size(indTS,2)  );

% atribui novoIndividuo TS atual 
novoInd = indTS;

% numero de TS 
for i=1:size(indTS,2)

    if (indTS(i)==153)    
        debug=0;
    end
    
    % obtem a chave da condicao de menor perda p/ dada chave indTS(i)
    chaveMP = otimizacaoAberturaCiclo(indTS(i), indBinOriginal, alim);

    % DEBUG
    global param;   
    param.lstChaves = [param.lstChaves, chaveMP];

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

% substituida por ver. 2024
function lstIndividuos = otimizaCicloIndividuo2021(indTS,indBinOriginal,alim)

% escolhe ordem de otimizacao das chaves
indTS = defineOrdemDeCiclosOtm(indTS,indBinOriginal,alim);

% vetor que guarda info se TS foi otimizada
otimizouTS(indTS) = 0;

% cria lista de individuos do tamanho do numero de TS (ciclos). 
lstIndividuos = zeros( size(indTS,2),size(indTS,2)  );

% atribui novoIndividuo TS atual 
novoInd = indTS;

% numero de TS 
for i=1:size(indTS,2)
   
    % se nao otimizou TS 
    if ( ~otimizouTS(indTS(i)) )

        % obtem a chave da condicao de menor perda p/ dada chave indTS(i)
        chaveMP = otimizacaoAberturaCiclo(indTS(i), indBinOriginal, alim);
    
    end
    
    % se nao membro do indTS (isto eh foi alterada)
    if ( ~ismember(chaveMP,indTS) )
        
        % altera indBin (para analise da proximo ciclo)
        indBinOriginal(indTS(i)) = 1;
        indBinOriginal(chaveMP) = 0;
        
        % atribui chave ao novo individuo     
        novoInd(i) = chaveMP;
    
    else
        
        % seta vetor otimizado
        otimizouTS(indTS(i)) = 1;
    
    end

    % lstIndividuos
    lstIndividuos(i,:) = novoInd;
    
end

% filtra lstIndividuos
lstIndividuos = unique(lstIndividuos, 'rows');

end

% OBS: 
function lstIndividuos = otimizaCicloIndividuo2020(indTS,indBinOriginal,alim)

% escolhe ordem de otimizacao das chaves
indTS = defineOrdemDeCiclosOtm(indTS,indBinOriginal,alim);

% vetor que guarda info se TS foi otimizada
otimizouTS(indTS) = 0;

% cria lista de individuos do tamanho do numero de TS (ciclos). 
lstIndividuos = zeros( size(indTS,2),size(indTS,2)  );

% atribui novoIndividuo TS atual 
novoInd = indTS;

% numero de TS 
for i=1:size(indTS,2)

    % se nao otimizou TS 
    if ( ~otimizouTS(indTS(i)) )

        % obtem a chave da condicao de menor perda p/ dada chave indTS(i)
        chaveMP = otimizacaoAberturaCiclo(indTS(i), indBinOriginal, alim);
    
    % se ja tiver otimizado pega info no vetor
    else
        
        chaveMP = deParaTS(indTS(i));
        
    end
    
    % se alterou a TS
    if(chaveMP ~= indTS(i))
        
        % altera indBin (para analise da proximo ciclo)
        indBinOriginal(indTS(i)) = 1;
        indBinOriginal(chaveMP) = 0;
        
        % atribui chave ao novo individuo     
        novoInd(i) = chaveMP;
    
    else
        
        % seta vetor otimizado
        otimizouTS(indTS(i)) = 1;
    
    end

    % lstIndividuos
    lstIndividuos(i,:) = novoInd;
    
end

% filtra lstIndividuos
lstIndividuos = unique(lstIndividuos, 'rows');

end

% correcao de lacos 
% OBS: mantendo como historico, pois nao da bons resultados
function lstIndividuos = otimizaCicloIndividuoPvp(indTS,indBinOriginal,alim)

% escolhe ordem de otimizacao das chaves
indTS = defineOrdemDeCiclosOtm(indTS,indBinOriginal,alim);

% novo individuo inicialmente eh igual as Tie Switchs antigas. Ele vai
% sendo preenchido chave por chave.
novoIndividuo = indTS;

% cria lista de individuos. Cada individuo representara um passo (loop de
% for) da transicao do indTS p/ o novoIndividuo.
lstIndividuos = zeros( size(indTS,2),size(indTS,2)  );

% para cada chave, i, do individuo
for i=1:size(indTS,2); 

    % obtem a chave da condicao de menor perda p/ dada chave indTS(i)
    chaveMP = otimizacaoAberturaCiclo(indTS(i), indBinOriginal, alim);
    
    % se chave menor perda jah esta no individuo, mantem chave anterior
    if ( ismember(chaveMP, novoIndividuo) )
    
        % mantem chave anterior
        novoIndividuo(i) = indTS(i); 

    else
        
        % preenche novo individuo     
        novoIndividuo(i) = chaveMP; 

    end
    
    lstIndividuos(i,:) = novoIndividuo;
    
end

% filtra lstIndividuos
lstIndividuos = unique(lstIndividuos, 'rows');

end