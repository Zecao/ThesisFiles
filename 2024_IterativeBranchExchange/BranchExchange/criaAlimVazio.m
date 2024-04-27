% cria struct Alimentador Vazio
function alimentador = criaAlimVazio()

alimentador = struct;

alimentador = setfield(alimentador,'Ftipo', []); % tipo: cemig ou ieee
alimentador = setfield(alimentador,'funcao', 'fluxo');
alimentador = setfield(alimentador,'Fnome', []);
alimentador = setfield(alimentador,'FbarraIdCab', []);
alimentador = setfield(alimentador,'FmBus', []);
alimentador = setfield(alimentador,'FmBranch', []);
alimentador = setfield(alimentador,'FmGerador', [] );
alimentador = setfield(alimentador,'FmChavesIEEE', [] );
alimentador = setfield(alimentador,'FmapVerticesArestas', []);

% campos alimentadores Cemig 
% alimentador = setfield(alimentador,'FmapTrechoBarraMontante', []);
% alimentador = setfield(alimentador,'FmapTrechoBarraJusante', []);
alimentador = setfield(alimentador,'FlstAlimentadores',false);

end

