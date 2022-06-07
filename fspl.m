% Free space path loss calculator
% f = frequency in Hz
% d = distance in m
% returns path loss in dB
% ramhdi, 07/06/2022

function pl=fspl(f,d)
  lambda = 3e8/f;
  pl = (lambda/(4*pi*d))^2;
  pl = -10*log10(pl);
end
