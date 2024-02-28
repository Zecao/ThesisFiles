% cria vetor resultados 
function vetorResultados = criaVetorResultados(algoritmo,arrayStructElite,telapsed,alim)

global param;

% obtem vetor perdas(elite) por geracao  
perdasXGen = getPerdasXGen(arrayStructElite,alim);

% cria vetorResultados 
vetorResultados = [
    % algoritmo;
    perdasXGen;
    param.NCAL;
    telapsed;
%     param.NOAC;
    param.NCALBL;
    param.contTestesRadialidade;
    ];

end