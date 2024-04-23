function alim = loadBus_Branch_Generator(sistema,alim)

switch sistema

    case 1 % 

        [bus,branch,chave] = Sis_16bus();        

    case 2 % 33-bus

        [bus,branch,chave] = Sis_33bus();

    case 3 % 70-bus

        [bus,branch,chave] = Sis_70bus();
        
    case 31 % 69-bus

        [bus,branch,chave] = Sis_69bus();

    case 4 % 136-bus Sistema_Brasileiro2008

        [bus,branch,chave] = Sis_136bus();

    case 5 % 84-bus Sistema_TPC2003

        [bus,branch,chave] = Sis_84bus();

    case 6 % 417-bus

        [bus,branch,chave] = Sis_417bus();

    case 7 % 119-bus

        [bus,branch,chave] = Sis_119bus();
        
    case 8 % CEMIG 

        [bus,branch,chave] = Sistema703barrasCemig();
        
    otherwise
        
        bus = [];
        branch = [];
        chave = [];
        
        disp('ERRO');

end

% bus
alim = trataBus(bus,alim);

% branch
alim = trataBranch(branch,alim,sistema);

% chave 
alim.FmChavesIEEE = chave;

% generator
alim = trataGenerator(alim);

end

function alim = trataBus(bus,alim)

% transforma demandas em kva p/ mva 
bus(:,5) = kva2mva(bus(:,5));
bus(:,6) = kva2mva(bus(:,6));

% transforma tensao em kv p/ pu
bus(:,3) = kv2pu(bus(:,3),alim.Vbase);

% converte formato p/ Matpower
mBus = zeros(size(bus,1),13);
mBus(:,1) = bus(:,1); % bus_i
mBus(:,2) = bus(:,2); % type
mBus(:,3) = bus(:,5); % Pd
mBus(:,4) = bus(:,6); % Qd
mBus(:,5) = 0; %1; % Gs conductance
mBus(:,6) = 0; %1; % Bs susceptance
mBus(:,7) = 1; % area
mBus(:,8) = bus(:,3); % Vm
mBus(:,9) = bus(:,4); % Va
mBus(:,10) = alim.Vbase; % baseKV
mBus(:,11) = 1; % zone
mBus(:,12) = 1.1; % Vmax
mBus(:,13) = 0.8; % Vmin 

alim.FmBus = mBus;

end

function alim = trataBranch(branch,alim,sistema)

% transforma base, se necessario
branch = zohms2zpu(branch,sistema,alim.Sbase,alim.Vbase);

% preenceh mBranch
mBranch = zeros(size(branch,1),13);

mBranch(:,1) = branch(:,1); %
mBranch(:,2) = branch(:,2); %
mBranch(:,3) = branch(:,3).*branch(:,5); % OBS resistencia em PU/km. OK
mBranch(:,4) = branch(:,4).*branch(:,5);
mBranch(:,5) = 0; % b 
mBranch(:,6) = branch(:,6); % rateA
mBranch(:,7) = branch(:,6); % rateB
mBranch(:,8) = branch(:,6); % rateC
mBranch(:,9) = 1; % ratio
mBranch(:,10) = 0; % angle
mBranch(:,11) = 1; % status
mBranch(:,12) = -360; % angmin
mBranch(:,13) = 360; % angmax

alim.FmBranch = mBranch;

end

function alim = trataGenerator(alim)

% get type 3 bus
indGerador = find(alim.FmBus(:,2)==3);

A = alim.FmBus(indGerador,:);    

%cria matriz mGerador       
mGerador = zeros(size(A,1),21);
mGerador = setaPotenciaGerador(mGerador,4.0,3.0);

% cria matrizes geradores
% bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
mGerador(:,1) = A(:,1); % bus number

mGerador(:,6) = 1.0; % voltage magnitude setpoint (p.u.)
mGerador(:,7) = alim.Sbase; % total MVA base of machine, defaults to baseMVA 
mGerador(:,8) = 1; % machine status

mGerador(:,11) = 0; % lower real power output of PQ capability curve (MW)
mGerador(:,12) = 0; % upper real power output of PQ capability curve (MW)
mGerador(:,13) = 0; % minimum reactive power output at PC1 (MVAr)
mGerador(:,14) = 0; % maximum reactive power output at PC1 (MVAr)
mGerador(:,15) = 0; % minimum reactive power output at PC2 (MVAr)
mGerador(:,16) = 0; % maximum reactive power output at PC2 (MVAr)
mGerador(:,17) = 0; % ramp rate for load following/AGC (MW/min)
mGerador(:,18) = 0; % ramp rate for 10 minute reserves (MW)
mGerador(:,19) = 0; % ramp rate for 30 minute reserves (MW)
mGerador(:,20) = 0; % ramp rate for reactive power (2 sec timescale) (MVAr/min)
mGerador(:,21) = 0; % area participation factor

%
alim.FmGerador = mGerador;

% setNoRaiz
alim.FbarraIdCab = mGerador(1,1);

end

% 
function mGerador = setaPotenciaGerador(mGerador,real,reativo) 

mGerador(:,2) = real; % real power output (MW)

mGerador(:,3) = 0; % reactive power output (MVAr)

mGerador(:,4) = reativo; % maximum reactive power output (MVAr)
mGerador(:,5) = -reativo; % minimum reactive power output (MVAr)

mGerador(:,9) = real*1.0; % maximum real power output (MW)
mGerador(:,10) = real*0.25; % minimum real power output (MW)

end

function vec = kv2pu(vec,Vbase)
 
vec = vec/Vbase;
 
end

% transforma Z(ohms) para Zpu, se necessario 
function B = zohms2zpu(B,sistema,Sbase,Vbase)

% calculo zBase
zBase = Vbase^2/Sbase; 

% calculo zpu = zohms/zbase;
B(:,3) = B(:,3)/zBase; 
B(:,4) = B(:,4)/zBase; 

% OLD CODE
% % OBS: todos os sistemas a excecao do 1  devem ter impedancias
% % trasnformadas p/ pu
% if ( ~  (sistema == 1) )
%     
%      % calculo zBase
%      zBase = Vbase^2/Sbase; 
%  
%      % calculo zpu = zohms/zbase;
%      B(:,3) = B(:,3)/zBase; 
%      B(:,4) = B(:,4)/zBase; 
%  
%  end
 
end