
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: 
%
% Author: 
% Institution: TCNJ
% Created: 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function butterfly_Vs_Wasps_Model_Old()

%
% Clears any previous plots that are open in MATLAB
clf;

%
% Time Information / Initialization
%
TFinal = 20;          % Simulation runs until time = TFinal. ie 20 Mating Seasons
dt = 0.0025;           % Time-step
t = 0;                 % Initialize Time to 0. Time will be in days
n = 0;                 % Initialize storage counter to 0.


%
% Initial Values
%
Vpop0 = 100; % Initial Population for Virgin Female Butterflies
Mpop0 = 0;  % Initial Population for Mated Female Butterflies
Tbpop0 = 75;    % Initial Population for T. brassicae
                  % NOTE: adjust in relation to pop size of butterflies
Tepop0 = 50;    % Initial Population for T. evanescens
                  % NOTE: adjust in relation to pop size of butterflies


%
% Parameter Values
%
lamda = 20;        % number of eggs laid by butterfly
                   % NOTE: we want to randomize lambda later on to be
                   % somewhere between 20 and 50
sigma = 0.45;     % rate at which the butterflies mate
phi = ;        % number of eggs laid by Tb
theta =  ;     % number of eggs laid by Te

path1 = ;    % likelihood that the eggs are parastized by Tb 
                % Should be between 20-40% ???
path2 = ;    % likelihood that the eggs are parastized by 
              % Te before one successful ride
              % Should be between 10-20% ???
path2Star = ;    % likelihood that the eggs are parastized by 
                  % Te after one successful ride
                  % Should be between 20-40% ???
                  %{ 
                    NOTE: We are going to assume a constant success rate.
                    ie. after each dt, X more of them will now have an
                    elevated rate. Start with 0, let's increase by some X
                    number each time.
                    # on path2 + # on path2Star = total Te pop
                  %}
path3 = ;    % likelihood that the eggs are not parasitized
              % Should be between 20-40% ???





%
% Saves Initial Values into Storage Vectors
%
S(1) = s0;
I(1) = i0;
R(1) = r0;
TimeVec(1) = t;

%
% While-loop that iteratively solves the coupled, differential equation
% system
%
while t<TFinal
   
    % Iterate storage counter and time, t
    n = n + 1;
    t = t + dt;
    
    % Define Lambda
    Lambda = mu*S(n) + mu*R(n) + muStar*I(n);
    
    % Solve Susceptible ODE w/ Euler Method
    S(n+1) = S(n) + dt * ( -beta*S(n)*I(n) - mu*S(n) + Lambda -nu*S(n) ); 
    
    % Solve Infected ODE w/ Euler Method
    I(n+1) = I(n) + dt * ( beta*S(n)*I(n) - gamma*I(n) - muStar*I(n) );
    
    % Solve Recovered ODE w/ Euler Method
    R(n+1) = R(n) + dt * ( gamma*I(n) - mu*R(n) + nu*S(n) ); 
    
    % Next time in time storage vector
    TimeVec(n+1) = t;
    
end

%
% Calculate Reproduction Number, R0, for the simulation
%
R0 = beta*Lambda / ((mu+nu)*(gamma+muStar));
fprintf('\n\nReproduction Number, R0 = %4.2f\n\n\n',R0);

%
% Plot Attributes
%
lw = 4;  % LineWidth (how thick the lines should be)
ms = 25; % MarkerSize (how big the plot points should be)
fs = 18; % FontSize (how big the font should be for labels)

%
% PLOT 1: Populations vs. Time
%
figure(1)
plot(TimeVec,S,'b.-','LineWidth',lw,'MarkerSize',ms); hold on;
plot(TimeVec,I,'r.-','LineWidth',lw,'MarkerSize',ms); hold on;
plot(TimeVec,R,'g.-','LineWidth',lw,'MarkerSize',ms); hold on;
xlabel('Time');
ylabel('Population Fraction');
leg = legend('Susceptible','Infected','Recovered');
set(gca,'FontSize',fs);
set(leg,'FontSize',fs);


%
% PLOT 2: Phase Plane Plot
%
figure(2)
plot(S,I,'b.-','LineWidth',lw,'MarkerSize',ms); hold on;
xlabel('Susceptible');
ylabel('Infected');
set(gca,'FontSize',fs);