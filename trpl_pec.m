% Two-ray path loss calculator
% f = frequency in Hz
% d = distance in m
% ht = transmitter height in m
% hr = receiver height in m
% er = plane relative permittivity
% sigma = plane conductivity in S/m
% pol = wave polarization, 'h' for horizontal or 'v' for vertical
% returns path loss in dB
% ramhdi, 07/06/2022

function pl=trpl_pec(f,d,ht,hr,pol)
  eo = 8.854e-12;
  lambda = 3e8/f;
  pl_fs = (lambda/(4*pi*d))^2;
  %psi = atan((ht + hr)/sqrt(d^2 - (ht-hr)^2));
  %theta = pi/2 - psi;
  %p = er - j*sigma/(2*pi*f*eo);
  gamma = 0;
  if pol == 'v'
    gamma = 1;
  elseif pol == 'h'
    gamma = -1;
  end

  r1 = sqrt(d^2 + (hr - ht)^2);
  r2 = sqrt(d^2 + (hr + ht)^2);
  dphi = 2*pi*(r1-r2)/lambda;
  F = 1 + gamma*exp(j*dphi);

  pl = pl_fs * abs(F)^2;
  pl = -10*log10(pl);
end
