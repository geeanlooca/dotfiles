function setGraphicalProperties(mode, varargin)
%SETGRAPHICALPROPERTIES Change the default MATLAB properties for drawing
%figures
%   SETGRAPHICALPROPERTIES(mode) sets some useful default values for
%   graphical proerties. 'mode' can be either 'normal' (default) or 'pro'
%   for professional typesetting (LaTeX).

parser = inputParser;
parser.addRequired('mode', @(x) validateattributes(x, {'char'}, {'scalartext'}));
parser.addOptional('docked', false, @(x) validateattributes(x, {'logical'}, ...
    {'scalar'}));


parse(parser, mode, varargin{:});

interpreter = 'tex';
titleFontWeight = 'normal';

switch lower(parser.Results.mode)
    case 'normal'
        interpreter = 'tex';
%         titleFontWeight = 'bold';
    case 'pro'
        interpreter = 'latex';
end

properties = {
  { 'defaultLegendInterpreter', interpreter }
  { 'defaultAxesTickLabelInterpreter', interpreter }
  { 'defaultTextInterpreter', interpreter }
  { 'defaultAxesTitleFontWeight', titleFontWeight };
};

for i = 1 : length(properties)
    p = properties{i};
    fprintf('\t- %s : %s\n', p{1}, mlreportgen.utils.toString(p{2}));
    set(groot, p{1}, p{2});
end

% Check that if figure position is not passed, it won't change the
% property

if parser.Results.docked == true
    set(groot,'DefaultFigureWindowStyle','docked');
    fprintf('\t- %s : %s\n', 'defaultFigureWindowStyle', 'docked');
else
    set(groot,'DefaultFigureWindowStyle','normal')
    fprintf('\t- %s : %s\n', 'defaultFigureWindowStyle', 'normal');
end


