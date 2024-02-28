% obtem vetor perdas(elite) por geracao 
function perdasXGen = getPerdasXGen(arrayStructElite,alim)

perdasXGen = [];

for i=1:alim.paramAG.numGeracoes
    
    perdasXGen = [perdasXGen; arrayStructElite(i).FFxXGen ];
  
end

end
