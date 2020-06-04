% % E = hc/¦Ë;
% h = 4.135667696*(10^(-15)); % eV*s
% c = 299792458; % m*s^(-1)
% wavelength = 680*10^(-9); % nm
% E = 1.8232; % eV
% dn/dT  = -9*10^(-3); % K^(-1)

Tc = -9*10^(-3); % K^(-1), temperature coefficient of RI for MoS2.
Ss = 136.4; % deg/RIU, SPR sensitivity.
beta = 0.08/0.025; % 2.5 mDeg * 10  = 500;
b = 1/(Tc*Ss*beta);


tifFile = 'E:\MoS2\20180326_MoS2_Ru\TIFF\B1_MoS2_50mM Ru_0 -0-4V_0-1VpS_2c_Pike_106fps';
tifDir = dir(fullfile(tifFile, '*.tiff'));
tif0 = im2double(imread(fullfile(tifFile, tifDir(1).name)));
ii = 200;
tif = im2double(imread(fullfile(tifFile, tifDir(ii).name)));
tif = tif - tif0;
temperature = b*tif;

figure('color', 'w');
imshow(tif0, 'DisplayRange',[], 'InitialMagnification', 'fit')
colormap hot
colorbar
% set(gca, 'CLim', [0 2]);
h = colorbar;
set(get(h, 'title'), 'string', 'T (K)', 'FontSize', 12);