
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: 
%
% Author: 
% Institution: TCNJ
% Created: 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function butterfly_Vs_Butterflies_Model()

%
% Time Information / Initialization
%
TFinal = 100;        % Simulation runs until time = TFinal. ie runs for 200 days
dt = 1;             % Time-step, should be one day
t = 0;              % Initialize Time to 0. Time will be in days
n = 0;              % Ininitalize index counter

%
% Initial Values
%
Butterpop0 = 1200;  % Initial Population of Butterflies
Vpop0 = 600;        % Initial Population of Virgin Female Butterflies
Mpop0 = 0;          % Initial Population of Mated Female Butterflies
Es0 = 0;            % Initial number of eggs layed in a safe place
Ed0 = 0;            % Initial number of eggs layed in a dangerous place

%
% Parameter Values
%
lambda = 7;         % number of eggs laid by butterfly
sigma = 0.30;        % rate at which the butterflies mate
mu = 0.20;           % death rate

gammaD = .3;

pD = .75;
pS = .25;

%
% Reference Variables
%                        
sevenDays = 0;      % shows it has not been 7 days yet

                        
%
% Saves Initial Values into Storage Vectors
%
Butterpop(1) = Butterpop0;
Vpop(1) = Vpop0;
Mpop(1) = Mpop0;
storeMpop(1) = Mpop0;

TimeVec(1) = t;

%
% While-loop that iteratively solves the coupled, differential equation
% system
%
while t < TFinal

    % Iterate storage counter and time, t
    n = n + 1;
    t = t + dt;
    
    %
    % Solve Virgin female population ODE w/ Euler Method
    %
    if mod(t, 7) == 0
        sevenDays = 1;
    end

    if sevenDays == 0
        % it has not been 7 days yet, the eggs have not begun to hatch
        Vpop(n+1) = Vpop(n) + dt * ( -1*(mu + sigma)*Vpop(n) );
    else 
        % the eggs are hatching, we are assumng 1/2 are female
        Vpop(n+1) = Vpop(n) + dt * ( (0.5)*(lambda*storeMpop(n-6))*(pS + pD*gammaD) - mu*Vpop(n) - sigma*Vpop(n) ) ;
    end

    %
    % Solve Mated female Butterfly population ODE w/ Euler Method
    %
     Mpop(n+1) = Mpop(n) + dt * ( sigma*Vpop(n) );    
      
               
    %
    % Solve Overall Butterfly population
    %    
     Butterpop(n+1) =  2*Vpop(n+1) ;

    
    % Butterflies/Wasps die after laying their eggs
     storeMpop(n+1) = Mpop(n+1);
     Mpop(n+1) = 0; 

    
    % Next time in time storage vector
     TimeVec(n+1) = t;   
     
end

%
% Plot Attributes
%
lw = 4;  % LineWidth (how thick the lines should be)
ms = 25; % MarkerSize (how big the plot points should be)
fs = 18; % FontSize (how big the font should be for labels)

%
% PLOT 1: Populations vs. Time
%
figure(2)
plot(TimeVec,Butterpop,'b.-','LineWidth',lw,'MarkerSize',ms); hold on;
xlabel('Time (days)');
ylabel('Population of P. Brassicae');
leg = legend('Butterfly without Anti-Aphrodisiac');
set(gca,'FontSize',fs);
set(leg,'FontSize',fs);