function plotaGrafo(alim)

% 
% sistema = getSistema(alim.Fnome);

% 
% ind = getIndividuoOtimo(sistema,alim);

% 
% debug = binario2tieSwitch(ind,alim);

%
% alim = setaBranchsAtivos(alim,ind);

% cria matriz sparse mBranch vetor Corrente.
branches = criaSparseMBranch(alim);

% gria grafo da rede. 
G = graph(branches);

plot(G)

end