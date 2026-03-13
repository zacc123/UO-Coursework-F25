% Script for ERTH555 PS2
% Zac Cross 
% `10/12/2025

clear all, clf reset, close all % clean up outputs


% Function to get all of the outputs for stress problem
function [tx, ty, tz, mag, normal_com, shear_mag, V, D] = traction(sigma_xx, sigma_xy, ...
                sigma_xz, sigma_yy, sigma_yz, sigma_zz, n)
    % Get the components of T
    tx = sigma_xx * n(1) + sigma_xy * n(2) + sigma_xz *n(3);
    ty = sigma_xy * n(1) + sigma_yy * n(2) + sigma_yz *n(3);
    tz = sigma_xz * n(1) + sigma_yz * n(2) + sigma_zz *n(3);
    t = [tx, ty, tz];
    mag = norm(t, 2);

    normal_mag = (tx*n(1) + ty * n(2) + tz*n(3))
    normal_com = normal_mag .* n;

    shear_com = t - normal_com;
    shear_mag = norm(shear_com, 2);

    stress = [sigma_xx, sigma_xy, sigma_xz;
              sigma_xy, sigma_yy, sigma_yz;
              sigma_xz, sigma_yz, sigma_zz];

    [V, D] = eig(stress);
end


test_n = [0.3015, 0.3015, 0.9045];
sigma_xx = -40;
sigma_yy = -60; 
sigma_zz = -80;
sigma_xy = 20;
sigma_xz = -10;
sigma_yz = 10;

[tx, ty, tz, mag, normal, shear_mag, V, D] = traction(sigma_xx, sigma_xy, sigma_xz, sigma_yy, sigma_yz, sigma_zz, test_n)
