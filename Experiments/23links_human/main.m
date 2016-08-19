
clear;clc;close all;
rng(1); % forcing the casual generator to be const

%% Add src to the path
addpath(genpath('src')); 
addpath(genpath('../../src'));

%% Generate subject model
subjectID = 1;
H = 1.70; % set manually the heigth in [m] of the subject;
M = 61;   % set manually the mass in [kg] of the subject;
subjectParams  = findAnthropometricParams(H,M);
filename = sprintf('models/XSensURDF_subj%d.urdf',subjectID);
URDFmodel = createXsensLikeURDFmodel(subjectParams,filename);

%% Load measurements from sensors
% SUIT
mvnxFilename = 'data/S_1bowingtask.mvnx';
[~] = extractSuitData(mvnxFilename,'data');
% FORCEPLATE  --> to be done!

%% Load URDF model
% model.FileName = sprintf('models/XSensURDF_subj%d.urdf',subjectID);
model.filename = filename;
modelLoader = iDynTree.ModelLoader();
if ~modelLoader.loadModelFromFile(model.filename);
    fprint('Something wrong with the model loading.')
end

% % LOAD MODEL FROM STRING  --> to be fixed, it doesn't work yet!!!
% modelLoader = iDynTree.ModelLoader();
% if ~modelLoader.loadModelFromString('urdfModel');
%     fprint('Something wrong with the model loading.')
% end

model   = modelLoader.model(); 
% sensors = modelLoader.sensors(); ->TO BE ADDED
                 