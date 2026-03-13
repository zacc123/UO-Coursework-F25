% fig_06_37 of Pollard and Fletcher (2005)
% plot stress trajectories for circular hole in infinite plaste
% biaxial remote stress
% Jaeger and Cook (1979)

clear all, clf reset; close all

ri = 1; sH = 150; sh = 100; pm = 175;

x = linspace(0,2.5,26)+eps; y = linspace(0,2.5,26);
[X,Y] = meshgrid(x,y);
[TH,R] = cart2pol(X,Y);

ST = sin(TH); S2T = sin(2*TH); ST2 = ST.^2; 
CT = cos(TH); C2T = cos(2*TH); CT2 = CT.^2;
R2 = (ri./R).^2; R4 = R2.^2;

% Polar stress components
SRR = -(0.5*(sH+sh)*(1-R2))-(pm*R2)-(0.5*(sH-sh)*((1-4*R2+3*R4).*C2T));
STT = -(0.5*(sH+sh)*(1+R2))+(pm*R2)+(0.5*(sH-sh)*((1+3*R4).*C2T));
SRT = 0.5*(sH-sh)*((1+2*R2-3*R4).*S2T);
SRR(find(R<1)) = nan; STT(find(R<1)) = nan; SRT(find(R<1)) = nan;

% Cartesian stress components
SXX = SRR.*CT2+STT.*ST2-2*SRT.*CT.*ST;
SYY = SRR.*ST2+STT.*CT2+2*SRT.*CT.*ST;
SXY = (SRR-STT).*CT.*ST+SRT.*(CT2-ST2);

% Principal stress trajectories
G1 = 0.5*atan2(2*SXY, SXX-SYY); G1(find(R<1))=nan;
U1 = cos(G1); V1 = sin(G1);
quiver(X,Y,U1,V1,0.2,'.'), axis equal, hold on
G1 = G1+pi/2; U1 = cos(G1); V1 = sin(G1);
quiver(X,Y,U1,V1,0.4,'.')
G1 = G1+pi/2; U1 = cos(G1); V1 = sin(G1);
quiver(X,Y,U1,V1,0.2,'.')
G1 = G1+pi/2; U1 = cos(G1); V1 = sin(G1);
quiver(X,Y,U1,V1,0.4,'.')