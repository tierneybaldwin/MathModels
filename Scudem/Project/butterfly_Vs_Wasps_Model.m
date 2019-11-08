

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: 
%
% Author: 
% Institution: TCNJ
% Created: 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function butterfly_Vs_Wasps_Model()

%
% Clears any previous plots that are open in MATLAB
clf;

%
% Time Information / Initialization
%
TFinal = 200;        % Simulation runs until time = TFinal. ie runs for 200 days
dt = 1;             % Time-step, should be roughly one day?
t = 0;              % Initialize Time to 0. Time will be in days
n = 0;              % Ininitalize index counter


%
% Initial Values
%
Vpop0 = 1000;       % Initial Population for Virgin Female Butterflies
Mpop0 = 0;          % Initial Population for Mated Female Butterflies
Tbpop0 = 500;       % Initial Population for T. brassicae
Tepop0 = 500;       % Initial Population for T. evanescens
Eb = 0;             % Initial amount of Eggs parasitized by T. brassicae
En = 0;             % Initial amount of Eggs not-parasitized
Ee = 0;             % Initial amount of Eggs parasitized by T. evanescens 
                        % before one successful lay
Estar = 0;          % Initial amount of Eggs parasitized by T. evanescens 
                        % after one successful lay


%
% Parameter Values
%
lambda = 35;        % number of eggs laid by butterfly
sigma = 0.45;       % rate at which the butterflies mate
phib = 29;          % number of eggs laid by Tb
phie = 29;          % number of eggs laid by Te
