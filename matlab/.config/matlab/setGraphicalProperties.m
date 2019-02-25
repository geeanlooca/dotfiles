function setGraphicalProperties(mode)
%SETGRAPHICALPROPERTIES Change the default MATLAB properties for drawing
%figures
%   SETGRAPHICALPROPERTIES(mode) sets some useful default values for
%   graphical proerties. 'mode' can be either 'normal' (default) or 'pro'
%   for professional typesetting (LaTeX).

p = inputParser;
p.addRequired('mode', @(x) validateattributes(x, {'char'}, {'scalartext'}));

parse(p, mode);

interpreter = 'tex';

switch lower(p.Results.mode)
    case 'normal'
        interpreter = 'tex';
    case 'pro'
        interpreter = 'latex';
end

properties = {
  { 'defaultLegendInterpreter', interpreter }
  { 'defaultAxesTickLabelInterpreter', interpreter }
  { 'defaultTextInterpreter', interpreter }
};

for i = 1 : length(properties)
    p = properties{i};
    fprintf('\t- %s : %s\n', p{1}, mlreportgen.utils.toString(p{2}));
    set(groot, p{1}, p{2});
end