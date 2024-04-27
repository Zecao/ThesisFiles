% cria struct Matpower
function mpc = criaStructMatpower(alim)

%     version: '2'
%     baseMVA: 100
%         bus: [16x13 double]
%         gen: [3x21 double]
%      branch: [16x13 double]

mpc = struct('version','2','baseMVA',alim.Sbase,'bus',alim.FmBus,'gen',alim.FmGerador,'branch',alim.FmBranch);

% Necessario p/ fluxo de potencia otimo - OPF
mpc = adicionaGenCost(alim.Fnome,mpc);

end

% adiciona custo geradores
function mpc = adicionaGenCost(nome,mpc)

%-----  OPF Data  -----%%
% generator cost data
%	1	startup	shutdown	n	x1	y1	...	xn	yn
%	2	startup	shutdown	n	c(n-1)	...	c0
% mpc.gencost = [
% 	2	0	0	3	0.038432	20	0;
% 	2	0	0	3	0.25	20	0;
% ];

% TODO
switch nome
       
    case '16-bus'
        
        gencost = [
        2	0	0	3	0.25 20 0;
        2	0	0	3	0.25 20 0;
        2	0	0	3	0.25 20 0;  ];
        
    case '33-bus'
        
        gencost = [
        2	0	0	3	0.25 20 0;  ];
        
    case '69-bus'
    
        gencost = [
        2	0	0	3	0.25 20 0;  ];
    
    case '136-bus'
        
        gencost = [
        2	0	0	3	0.25 20 0;  ];
        
    case '84-bus'

        gencost = [
        2	0	0	3	0.25 20 0;
        2	0	0	3	0.25 20 0;
        2	0	0	3	0.25 20 0;
        2	0	0	3	0.25 20 0;  
        2	0	0	3	0.25 20 0;
        2	0	0	3	0.25 20 0;
        2	0	0	3	0.25 20 0;  
        2	0	0	3	0.25 20 0;
        2	0	0	3	0.25 20 0;
        2	0	0	3	0.25 20 0;
        2	0	0	3	0.25 20 0;  ];
        
    otherwise
        
        % linha de custo p/ cada gerador     
        gen = [
        2	0	0	3	0.25 20 0;  ];
    
        % numero de geradores
        numGeradores = size(mpc.gen,1);
        
        % repete gen o numero de geradores
        gencost = repmat(gen,numGeradores,1);

end 

mpc = setfield(mpc,'gencost',gencost);

end

% MODEL     1   cost model, 1 = piecewise linear, 2 = polynomial
% STARTUP   2   startup cost in US dollars*
% SHUTDOWN  3   shutdown cost in US dollars*
% NCOST     4   number of cost coefficients for polynomial cost function,
% or number of data points for piecewise linear
% COST      5   parameters defining total cost function f(p) begin in this column,
% units of f and p are $/hr and MW (or MVAr), respectively
% (MODEL = 1) ) p0; f0; p1; f1; ... ; pn; fn
% where p0 < p1 <    < pn and the cost f(p) is defined by
% the coordinates (p0; f0), (p1; f1), . . . , (pn; fn)
% of the end/break-points of the piecewise linear cost
% (MODEL = 2) ) cn; ... ; c1; c0
% n + 1 coefficients of n-th order polynomial cost, starting with
% highest order, where cost is f(p) = cnp^n + ... + c1p + c0