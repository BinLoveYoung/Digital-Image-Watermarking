function iFaf = ifrft( f,a )

% The inverse fast Fractional Fourier Transform
% input: f = samples of the signal
%        a = fractional power
% output: Faf = fast Fractional Fourier transform

% H.M. Ozaktas, M.A. Kutay, and G. Bozdagi.
% [i]Digital computation of the fractional Fourier transform.[/i]
% IEEE Trans. Sig. Proc., 44:2141--2150, 1996.

narginchk(2, 2);
f = f(:);
N = length(f);
shft = rem((0:N-1)+fix(N/2),N)+1;
sN = sqrt(N);
a = mod(-a,4);
% do special cases
if (a==0), iFaf = f; return; end;
if (a==2), iFaf = flipud(f); return; end;
if (a==1), iFaf(shft,1) = fft(f(shft))/sN; return; end 
if (a==3), iFaf(shft,1) = ifft(f(shft))*sN; return; end
% reduce to interval 0.5 < a < 1.5
if (a>2.0), a = a-2; f = flipud(f); end
if (a>1.5), a = a-1; f(shft,1) = fft(f(shft))/sN; end
if (a<0.5), a = a+1; f(shft,1) = ifft(f(shft))*sN; end
% the general case for 0.5 < a < 1.5
alpha = a*pi/2;
tana2 = tan(alpha/2);
sina = sin(alpha);
f = [zeros(N-1,1) ; interp(f) ; zeros(N-1,1)];
% chirp premultiplication
chrp = exp(-i*pi/N*tana2/4*(-2*N+2:2*N-2)'.^2);
f = chrp.*f;
% chirp convolution
c = pi/N/sina/4;
iFaf = fconv(exp(i*c*(-(4*N-4):4*N-4)'.^2),f);
iFaf = iFaf(4*N-3:8*N-7)*sqrt(c/pi);
% chirp post multiplication
iFaf = chrp.*iFaf;
% normalizing constant
iFaf = exp(-i*(1-a)*pi/4)*iFaf(N:2:end-N+1);

end

