% 
function alim = carregaArquivoIEEE(sistema)
 
% cria alimentador vazio
alim = criaAlimVazio();
 
switch sistema
     
     case 1 %ok
         alim.Sbase = 1; %ok
         alim.Vbase = 23; 
         alim.Fnome = '16-bus';
         
     case 2 
         alim.Sbase = 1; %10 orig. % 100MVA = 0.201860379372922
         alim.Vbase = 12.66;
         alim.Fnome = '33-bus';         
         
      case 3
         alim.Sbase = 10; %10 ok % 1 e 100 nao ok (erro numerico)
         alim.Vbase = 12.66;
         alim.Fnome = '69-bus';   
     
     case 4 
         alim.Sbase = 100; %100 ok % 1 e 100 nao ok (erro numerico) 
         alim.Vbase = 13.8;
         alim.Fnome = '136-bus'; %Brasileiro        
         
     case 5 
         alim.Sbase = 1;  %100
         alim.Vbase = 11.4;
         alim.Fnome = '84-bus'; %TPC2003        
         
     case 6
         alim.Sbase = 100;
         alim.Vbase = 10.0;
         alim.Fnome = '417-bus'; 
         
    case 7
         alim.Sbase = 1; %100
         alim.Vbase = 11.0;
         alim.Fnome = '119-bus';
         
     case 8
         alim.Sbase = 100; % orig. 100000kVA.
         alim.Vbase = 13.8;
         alim.Fnome = '703-bus'; %'esCemigCarrano';
         
     otherwise 
        disp('ERRO');
end 
 
end