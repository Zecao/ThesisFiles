% gera populacao inicial Alim
function [populacao, fitness] = geraPopulacao(alim)

% alimentador Cemig  
if (strcmp(alim.Ftipo,'cemig'))
    
    % obtem interconexoes 
    lstChaveInterConexoes = obtemInterConexoesPorLst(alim.FlstAlimentadores);
    
    % constroi populacao Cemig
    [populacao, fitness] = constroiPopulacaoCemig(lstChaveInterConexoes,alim);
     
% alimentadores IEEE
else
       
	% carrega populacao IEEE
	populacao = carregaPopulacaoIEEE(alim);
    
    % adiciona individuo Original na populacao
    populacao = adicionaConfOriginal(alim,populacao);

    % Avalia a funcao objetiva para a nova populacao
    fitness = avaliaPopulacao(populacao, alim, 1); 

end

end

% carrega populacao IEEE
function populacao = carregaPopulacaoIEEE(alim)

populacao =[];

% condicao de retorno
if (alim.paramAG.loadPopMAT==0)
    return;
end

switch alim.Fnome 
    
    case '16-bus';

        % OBS; ha grande chance de que na populacao gerada ja exista o
        % minimo, como eh caso da populacao 'populacaoSis1.mat'
        load('populacaoSis1.mat');
  
    case '33-bus';
        
        load('populacaoSis2.mat');
            
    case '69-bus'
        
        load('populacaoSis3.mat');

    case '136-bus';
         
        % arquivo populacao (ja convertido)
        load('populacaoSis4.mat');        
      
    case '84-bus';
           
        load('populacaoSis5.mat'); 
          
    case '417-bus';
        
        load('populacaoSis6.mat'); 
        
    case '119-bus';
        
        load('populacaoSis7.mat'); 
        
    otherwise
    
        %gera populacao utilizando o algoritmo do Carlos
        aleatorio = true; %default 
        populacao = gerapopCarlos(alim, aleatorio);
            
end

end

% adiciona individuo Original na populacao
function populacao = adicionaConfOriginal(alim,populacao)

% adiciona configuracao atual
indOriginal = chaves2individuo(alim.FmChavesIEEE);

% SE indOriginal NAO eh membro
if (~ismember(indOriginal,populacao))

    % adiciona individuo configuracao original na populacao
    populacao = [indOriginal; populacao];
    
end

end
