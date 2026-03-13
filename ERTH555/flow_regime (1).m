% Comments with explanations line by line
          
clear all % clears all allocated variables, functions, breakpoints, ... etc from the current workspace
close all % closes all open figure windows
clc       % clears the command window 

% Vary magma viscosity
p   = linspace(1,3,100);  % exponent for magma viscosity
                          % Setting up a vector p with points between 3 and
                          % 1 with 100 grid points      

eta = 10.^p;    % magma viscosity (Pa s)
                % Setting eta to be 10^p coordinate

% Vary dike width
w   = linspace(1,100,100); % Make another vector from x=1 to x=100 
                           % with 100 grid points

% Constants
v   = 1;   % flow velocity (m/s) % Set V_max to be 0.1 
rho = 2750; % magma density (kg/m^3) % Set density to be 2750
g   = 9.8;  % gravitational acceleration (m/s^2) % accelaration due to gravity
 
% Compute Reynold's number

[ETA,W] = meshgrid(eta,w); % Create a 2 2D matrices the size of eta x w
                           % ETA is a matrix where each row is the eta
                           % vector, with w rows, W has w on each row for
                           % eta columns

Re = rho*v*W./ETA;         % Calculate Re as a 2D matrix using ETA and W

% Make plots
figure  % creates a new figure window
contourf(log10(ETA),W,log10(Re)) % create contour plot of RE with Log(eta) on the x
                                 % W on the y. 
xlabel('log viscosity (Pa s)') % Sets the x label
ylabel('Dike width (m)') % Sets the y label
set(gca, 'FontSize', 14) % set plot properties
colorbar % place a color bar
title(['log Re, v = ' num2str(v) ' m/s']) % set the title
caxis([0.5 4]) % set the color bar axis

hold on;
% Overlay a line for a specific Reynolds number threshold
threshold = 3.3; % Define a threshold for Reynolds number
contour(log10(ETA), W, log10(Re), [threshold threshold], 'k--', 'LineWidth', 2); % Add contour line for threshold