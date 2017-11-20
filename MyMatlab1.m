%% MyMatlab1
% This script solves the problem and creates the 'solution1.txt' file
%addpath('dependencies')
global pfotemp
%global solutionMPC_FIUN
scenarioDir = pfotemp;
rawFile = fullfile(scenarioDir, 'powersystem.raw');
genFile = fullfile(scenarioDir, 'generator.csv');
contingFile = fullfile(scenarioDir, 'contingency.csv');
mpc = convert2mpc(rawFile,genFile);
contingencies = loadContingencies(mpc,contingFile);
[solutionMPC_FIUN, ~] = solve_scenario(mpc, contingencies,1);
save('solution0_FIUN.mat','solutionMPC_FIUN')