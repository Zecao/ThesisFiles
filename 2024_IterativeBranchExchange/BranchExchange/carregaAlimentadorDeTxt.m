function alim = carregaAlimentadorDeTxt(sistema,paramAG)
 
alim = carregaAlimentadorIEEE(sistema);

alim.paramAG = paramAG;

% OLD CODE manter
% switch sistema
%      
%      % sistemas Cemig
%     case 0
%          
%         % alim = carregaAlimentadorCemigMP(alimStr);
%          
%     case 'PSAU13' 
%         
%         B = PSAU13();
%         
%         alim.FmBranch(:,1)= B(:,2);
%         alim.FmBranch(:,2)= B(:,3);
%         
%         % acerta linhas 
%         alim.FmBranch(:,11)= B(:,4);
%         
%     case 'SFIQ410' 
%         
%         B = SFIQ410();
%         
%         alim.FmBranch(:,1)= B(:,2);
%         alim.FmBranch(:,2)= B(:,3);
%         
%         % acerta linhas 
%         alim.FmBranch(:,11)= B(:,4);
%         
%     otherwise
%          
%         alim = carregaAlimentadorIEEE(sistema);
%            
% end
 
end

function alim = carregaAlimentadorCemigMP(alimStr)

B = PSAU13();
 
% preenceh mBranch
mBranch = zeros(size(B,1),13);

mBranch(:,1) = B(:,1); %
mBranch(:,2) = B(:,2); %
mBranch(:,3) = B(:,3).*B(:,5); % OBS resistencia em PU/km. OK
mBranch(:,4) = B(:,4).*B(:,5);
mBranch(:,5) = 0; % b 
mBranch(:,6) = B(:,6); % rateA
mBranch(:,7) = B(:,6); % rateB
mBranch(:,8) = B(:,6); % rateC
mBranch(:,9) = 1; % ratio
mBranch(:,10) = 0; % angle
mBranch(:,11) = 1; % status
mBranch(:,12) = -360; % angmin
mBranch(:,13) = 360; % angmax

alim.FmBranch = mBranch;
 
end
 