% retorna o numero do sistema (rede) de acordo com o nome
function sis = getSistema(nome)

switch nome
    
    case '16-bus'; 
        sis = 1;
        return;
    case '33-bus';
        sis = 2;
        return;
    case '70-bus';
        sis = 3;
        return;
    case '69-bus';
        sis = 31;
    case '136-bus';
        sis = 4;
        return;
    case '84-bus';
        sis = 5;
        return;
    case '417-bus';
        sis = 6;        
        return;
    case '119-bus'; 
        sis = 7;        
        return;
    case '703-bus'; 
        sis = 8;        
        return;
        
    otherwise
        sis = [];
end

end

