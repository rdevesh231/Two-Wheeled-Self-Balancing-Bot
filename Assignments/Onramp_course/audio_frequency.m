load Cchord
n = numel(y) ;
t = 0:n-1 ;
t = t/fs ;
plot(t,y)
yfft = abs(fft(y)) ;
f = 0:n-1 ;
f = f*fs/n ;
plot(f,yfft)
xlim([0 1000])