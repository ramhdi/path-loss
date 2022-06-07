% Path loss formulas example
% ramhdi, 07/06/2022

clear all;close all;clc
ht = 25000/3.3;
hr = 15;
er = 15;
eo = 8.854e-12;
sigma = 0.005;

ax=[];
p1000fs = [];
p1000h = [];
p1000v = [];
p2000fs = [];
p2000v = [];
p2000h = [];
f1000 = 1000e6;
f2000 = 2000e6;
lambda1000 = 3e8/f1000;
lambda2000 = 3e8/f2000;

for i=logspace(4, 6, 1000) % 100 km to 1000 km
    d = i;
    ax = [ax i];
    pl1000fs  = 10^(-fspl(f1000,d)/10);
    pl2000fs  = 10^(-fspl(f2000,d)/10);

    pl1000v = 10^(-trpl(f1000,d,ht,hr,er,sigma,'v')/10);
    pl1000h = 10^(-trpl(f1000,d,ht,hr,er,sigma,'h')/10);
    pl2000v = 10^(-trpl(f2000,d,ht,hr,er,sigma,'v')/10);
    pl2000h = 10^(-trpl(f2000,d,ht,hr,er,sigma,'h')/10);

    % pec, sigma = infty
    %pl1000v = 10^(-trpl_pec(f1000,d,ht,hr,'v')/10);
    %pl1000h = 10^(-trpl_pec(f1000,d,ht,hr,'h')/10);
    %pl2000v = 10^(-trpl_pec(f2000,d,ht,hr,'v')/10);
    %pl2000h = 10^(-trpl_pec(f2000,d,ht,hr,'h')/10);

    p1000fs=[p1000fs, -10*log10(pl1000fs)];
    p1000v=[p1000v, -10*log10(pl1000v)];
    p1000h=[p1000h, -10*log10(pl1000h)];
    p2000fs=[p2000fs, -10*log10(pl2000fs)];
    p2000v=[p2000v, -10*log10(pl2000v)];
    p2000h=[p2000h, -10*log10(pl2000h)];
end

figure; hold on;
semilogx(ax,p1000fs,'--');
semilogx(ax,p1000h);
semilogx(ax,p1000v);
hold off;
grid on;

title('Path loss (h_t = 25000 ft, h_r = 15 m, \epsilon_r = 15, \sigma = 0.005 S/m)');
xlabel('Logarithmic distance (m)');
ylabel('Path loss (dB)');
legend('1000 MHz FS', '1000 MHz TR V', '1000 MHz TR H','Location','southeast');
%xlim([1 10]);
%ylim([50 130]);


figure; hold on;
semilogx(ax,p2000fs,'--');
semilogx(ax,p2000v);
semilogx(ax,p2000h);
hold off;
grid on;

title('Path loss (h_t = 25000 ft, h_r = 15 m, \epsilon_r = 15, \sigma = 0.005 S/m)');
xlabel('Logarithmic distance (m)');
ylabel('Path loss (dB)');
legend('2000 MHz FS', '2000 MHz TR V', '2000 MHz TR H', 'Location','southeast');
%xlim([1 10]);
%ylim([50 130]);
