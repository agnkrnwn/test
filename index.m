len = length(range);
K = 2^nextpow2(2*len - 1);
halfK = round(K/2);
U = zeros(halfK, 1);
centfreqs = data.model.cochlea.centfreqs;

for i = 1 : data.model.cochlea.gt.nch % number of channels
    x = data.au(range, i).*window;
    X = abs(fft(x, K));
    bin = round(2*centfreqs(i)*K/data.fs);
%     if i==4 plot(X); pause; end
    X(bin : halfK) = 0;
    U = U + X(1:halfK);
end
U = U';