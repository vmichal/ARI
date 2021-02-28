%PAdemo - Argument Principle demonstration
%
% Author(s):    M. Sebek, 
% Copyright (c) 2008 by PolyX, Ltd.
% 
%-----------------------------------------------------------------------------------------
clc
global PGLOBAL;
eval('PGLOBAL.FORMAT;',...
   'error(''Use PINIT to initialize the Polynomial Toolbox.'');');
format compact

film = 1 % film = 1 runs plots in movie style, film = o runs plots in one go
echo on

%***************************************************************
%*                                                             *
%*   DEMO:     Argument Principle                              *
%*                                                             *                                                         *
%***************************************************************

% one zero outside the conture
H=(s+5),PAplot(film,H,4000)
pause
% one pole outside
H=25/(s+5),PAplot(film,H,800)
pause
% one zero inside
H=(s+.5),PAplot(film,H,4000)
pause
% one pole inside
H=1/(s+.5),PAplot(film,H,1000)
pause
% zero and pole both outside
H=2*(s+5)/(s-5),PAplot(film,H,800)
pause
% zero and pole both inside
H=2*(s+0.5)/(s-0.5),PAplot(film,H,1000)
pause
% 2 zeros inside
H=2*(s+0.5)*(s-.1),PAplot(film,H,10000)
pause
% 2 zeros a one pole, all inside
H=2*(s+0.5)*(s-.1)/(s-0.5),PAplot(film,H,800)
pause
echo off
% end PAdemo



