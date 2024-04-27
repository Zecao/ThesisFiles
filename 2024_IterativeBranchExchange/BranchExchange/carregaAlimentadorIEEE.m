% carrega alimentador IEEE de acordo com o sistema
 function alim = carregaAlimentadorIEEE(sistema)

% carrega arquivo formato IEEE
alim = carregaArquivoIEEE(sistema);

%
alim = loadBus_Branch_Generator(sistema,alim);

% obtem individuo original 
indOriginal = chaves2individuo(alim.FmChavesIEEE);

% configura Branchs de acordo com individuo original 
% OBS: necessario este codigo pois originalmente o alimentador pode estar
% com todos os branchs fechados (anel).
% OBS2: codigco aqui pq carrego matriz branch primeiro q matriz chaves...
alim = setaBranchsAtivos(alim,indOriginal);

% seta tipo
alim.Ftipo = 'ieee';

% cria FmapVerticesArestas
alim = criaMapVerticesArestas(alim);

 end 