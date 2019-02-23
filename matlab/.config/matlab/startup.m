%% My MATLAB(C) startup script
% Author: Gianluca Marcon
% Email (personal): marcon.gluca@gmail.com
% Email (edu): gianluca.marcon@dei.unipd.it
%

%% Research code base

dirs = {
    fullfile('~', 'Nextcloud', 'PhD', 'research', 'code')
    fullfile('~', 'Dropbox', 'code')
    fullfile('~', 'cacca')
    };

D = length(dirs);

fprintf('===================================\n');
fprintf('=  Adding folders to MATLAB path  =\n');
fprintf('===================================\n\n');

for i = 1 : D
    directory = dirs{i};
    if exist(directory, 'dir')
        fprintf('[OK] %s\n', directory)
        addpath(genpath(directory));
    else
        fprintf(2, '[FAILED] %s\n', directory)
    end
end


% clear every variable used in this script.
clear;