%% My MATLAB(C) startup script
% Author: Gianluca Marcon
% Email (personal): marcon.gluca@gmail.com
% Email (edu): gianluca.marcon@dei.unipd.it
% Github: github.com/geeanlooca


fprintf('Executing startup.m\n');
fprintf('===================\n\n');


% Print Matlab version and system architecture
fprintf('MATLAB version: %s\n', version);
fprintf('Current architecture: %s\n', computer);
fprintf('MATLAB License Number: %s\n', license);


%% Research code base

dirs = {};

% Determine system platform
if isunix    
    homeDir = fullfile('~');
    dotFiles = fullfile(homeDir, '.config', 'matlab');
elseif ispc
    homeDir = fullfile(getenv('HOMEDRIVE'), getenv('HOMEPATH'));
    dotFiles = fullfile(homeDir, 'dotfiles', 'matlab', '.config', 'matlab');
end

% Cloud storage location
dropBoxDir = fullfile(homeDir, 'Dropbox', 'code');
nextCloudDir = fullfile(homeDir, 'Nextcloud', 'PhD', 'research', 'code');

dirs = {
    nextCloudDir
    dropBoxDir
    fullfile(dropBoxDir, 'Raman')
    fullfile(dropBoxDir, 'SIF')
    fullfile(dropBoxDir, 'Utils')
    fullfile(dropBoxDir, 'Numerical')
    fullfile(dropBoxDir, 'Numerical\Shooting')
    fullfile(dotFiles, 'linspecer');
    fullfile(dotFiles, 'cbrewer');
    };


if ~isempty(dirs)
    D = length(dirs);
    fprintf('\nAdding folders to MATLAB path\n');
    fprintf('=============================\n\n');
    
    for i = 1 : D
        directory = dirs{i};
        if exist(directory, 'dir')
            fprintf('\t[OK] %s\n', directory)
            addpath(directory);
        else
            fprintf(2, '\t[FAILED] %s\n', directory)
        end
    end    
end

%% Graphical properties

fprintf('\n\nSetting default graphical properties\n');
fprintf('====================================\n\n');

fontSize = 14;

properties = {
    { 'defaultLineLineWidth', 1 }
    { 'defaultFigureColor', 'w'}
    { 'defaultAxesBox', 'on'}
    { 'defaultAxesFontSize', fontSize }
    { 'defaultLegendFontSize', fontSize }
    { 'defaultTextFontSize', fontSize }
    { 'defaultLegendLocation', 'best' }
    { 'defaultLineMarkerSize', 12 }
    { 'defaultAxesTitleFontSizeMultiplier', 1.2 }
    { 'defaultAxesXMinorTick', 'on' }
    { 'defaultAxesYMinorTick', 'on' }
    { 'defaultAxesXGrid', 'off' }
    { 'defaultAxesYGrid', 'off' }
};

for i = 1 : length(properties)
    p = properties{i};
    fprintf('\t- %s : %s\n', p{1}, mlreportgen.utils.toString(p{2}));
    set(groot, p{1}, p{2});
end


% Make the command window display variables in a compact way
set(0, 'formatSpacing', 'compact')

% Set default graphical properties
setGraphicalProperties('normal');

% Set default colormap
if exist('linspecer', 'file')
    % File Exchange - https://it.mathworks.com/matlabcentral/fileexchange/42673
    set(0,'DefaultFigureColormap',linspecer);
    set(0,'DefaultAxesColorOrder',linspecer(8))
    fprintf('\t- Default colormap: linspecer\n');
end

if exist('cbrewer', 'file')
    % File Exchange - www.mathworks.com/matlabcentral/fileexchange/34087
    % see http://colorbrewer2.org/ for more options
    set(0,'DefaultFigureColormap',cbrewer('seq','YlOrRd',64, 'pchip'));
    set(0,'DefaultAxesColorOrder',cbrewer('qual','Dark2', 8))
end


%% Diary

fprintf('\nDiary\n');
fprintf('=====\n\n');

diarypath = [];

if exist(dropBoxDir, 'dir')
    diarypath = dropBoxDir;
elseif exist(nextCloudDir, 'dir')
    diarypath = nextCloudDir;
else
    % if neither Dropbox or Nextcloud are installed, save the diary files
    % to the default userpath
    diarypath = userpath;
end

if ~isempty(diarypath)
    
    % create the directory containing the diary entries
    diarypath = fullfile(diarypath, '.diary');
    if ~exist(diarypath, 'dir')
        mkdir(diarypath);
    end
    
    filename = sprintf('diary-%s-%s', date, hostname);

    % enable diary logging
    diary(fullfile(diarypath, filename));

    fprintf('\t- Saving diary in %s\n', diarypath);
end


%% Timers

%% finish.m?

%% Print current timestamp
time = clock;
time = time(4:end);
fprintf('\n\n\t\t%d:%d:%d, %s\n', time(1), time(2), round(time(3)), date);

% clear every variable used in this script.
clear;