function name = hostname()
%HOSTNAME returns the name of the computer (hostname)
% name = hostname()
%
% WARN: output string is converted to lower case
%
%
% See also SYSTEM, GETENV, ISPC, ISUNIX
%
% m j m a r i n j (AT) y a h o o (DOT) e s
% (c) MJMJ/2007
% MOD: MJMJ/2013
[ret, name] = system('hostname');
if ret ~= 0
    if ispc
        name = getenv('COMPUTERNAME');
    else
        name = getenv('HOSTNAME');
    end
end

name = strtrim(lower(name));

end
