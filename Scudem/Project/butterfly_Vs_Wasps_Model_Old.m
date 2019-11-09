
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: 
%
% Author: 
% Institution: TCNJ
% Created: 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%{ 
    
    %
    % Solve Virgin male population ODE w/ Euler Method
    %
    if mod(dt, 7) == 0
        sevenDays = 1;
    end
    
    if sevenDays == 0
        % it has not been 7 days yet, the eggs have not begun to hatch
        Vmpop(n+1) = Vmpop(n) + dt * ( -mu*Vmpop(n) - sigma*Vmpop(n));
    else 
        % the eggs are hatching, 2/5 are male
        Vmpop(n+1) = Vmpop(n) + dt * ( (2/5)*(Eb(n-6) + En(n-6) + Ee(n-6)) - mu*Vmpop(n) - % sigma*Vfpop(n));
    end

Eb0 = 0;            % Initial amount of Eggs parasitized by T. brassicae
Ee0 = 0;            % Initial amount of Eggs parasitized by T. evanescens 
En0 = 0;            % Initial amount of Eggs not-parasitized

Eb(1) = Eb0;
Ee(1) = Ee0;
En(1) = En0;




    %
    % Solve Egg population ODE w/ Euler Method (eggs parasitized by T.B.)
    %    
    if mod(dt, 7) == 0
        sevenDays = 1;
    end
    
    if sevenDays == 0
        % it has not been 7 days yet, the eggs have not begun to hatch
        Eb(n+1) = Eb(n) + dt * ( p1*(lambda-phi)*Mpop(n) );
    else 
        % the eggs are hatching
        Eb(n+1) = Eb(n) + dt * ( p1*(lambda-phi)*Mpop(n) - Eb(n-6) );
    end

    %
    % Solve Egg population ODE w/ Euler Method (eggs parasitized by T.E.)
    %    
    if mod(dt, 7) == 0
        sevenDays = 1;
    end
    
    if sevenDays == 0
        % it has not been 7 days yet, the eggs have not begun to hatch
        Ee(n+1) = Ee(n) + dt * ( p2*(lambda-phi)*Mpop(n) );
    else 
        % the eggs are hatching
        Ee(n+1) = Ee(n) + dt * ( p2*(lambda-phi)*Mpop(n) - Ee(n-6) );
    end  
    
    %
    % Solve Egg population ODE w/ Euler Method (eggs that haven't been parasitized)
    %    
    if mod(dt, 7) == 0
        sevenDays = 1;
    end
    
    if sevenDays == 0
        % it has not been 7 days yet, the eggs have not begun to hatch
        En(n+1) = En(n) + dt * ( p3*(lambda)*Mpop(n) );
    else 
        % the eggs are hatching
        En(n+1) = En(n) + dt * ( p3*(lambda)*Mpop(n) - En(n-6) );
    end
%}





%{     
    %
    % Solve virgin T.B. population ODE w/ Euler Method
    %
    if mod(dt, 10) == 0
        tenDays = 1;
    end
    
    if tenDays == 0
        % it has not been 10 days yet, the eggs have not begun to hatch
        TbVpop(n+1) = TbVpop(n) + dt * ( -mu*TbVpop(n) - sigma*TbVpop(n) ); 
    else 
        % the eggs are hatching, 24 out of the 29 will be female
        TbVpop(n+1) = TbVpop(n) + dt * ( (24/29)*(p1*storeTbMpop(n-9)) - mu*TbVpop(n) - sigma*TbVpop(n) );
    end        

    %
    % Solve mated T.B. population ODE w/ Euler Method
    %   
        TbMpop(n+1) = TbMpop(n) + dt * ( sigma*TbVpop(n) );  

    
    
    %
    % Solve T.E. population ODE w/ Euler Method
    %
    if mod(dt, 10) == 0
        tenDays = 1;
    end
    
    if tenDays == 0
        % it has not been 10 days yet, the eggs have not begun to hatch
        TeVpop(n+1) = TeVpop(n) + dt * ( -mu*TeVpop(n) - sigma*TeVpop(n) ); 
    else 
        % the eggs are hatching, 24 out of the 29 will be female
        TeVpop(n+1) = TeVpop(n) + dt * ( (24/29)*(p2*storeTeMpop(n-9)) - mu*TeVpop(n) - sigma*TbVpop(n) );
    end
    
    %
    % Solve mated T.B. population ODE w/ Euler Method
    %   
        TeMpop(n+1) = TeMpop(n) + dt * ( sigma*TeVpop(n) );     
    
%} 

   %{ 


       
 %}
    %{
  
    %}

