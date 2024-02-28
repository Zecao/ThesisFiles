
function ind = getIndividuoFechado(sistema)

%   retorna individuo fechado

switch sistema
    
    case 1 % 'alim\Sistema_Zhu2002_3fontes.txt';

        ind = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
      
    case 2 % alim\Sistema_Zhu2002.txt';

        ind = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
1 1 1 1 1 1 1 1];
        
    case 3 % 'alim\Sistema_Huang2002.txt';

        ind = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
1 1 1 1 1 1 1 1 1];
    
    case 4 % 'alim\Sistema_Brasileiro2008.txt';

        ind = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
        
    case 5 % 'alim\Sistema_TPC2003.txt';

        ind = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ];
        
    case 6 % 0.498793181651893
        ind = ones(1,473);
        
    case 7 
        ind = ones(1,133);
%         ind = ones(1,132);
        
    case 8 % 1.68890176326413
        ind = ones(1,714);

end 

end

