load starData
[sHa,idx] = min(spectra);
lambdaHa = lambda(idx);
z = lambdaHa/656.28 - 1;
speed = z*299792.458 
for v = 1:7
    s = spectra(:,v);

    if speed(v) <= 0
        loglog(lambda,s,"--")
    else
       loglog(lambda,s,"LineWidth",3) 
    end
    hold on
end
hold off
legend(starnames)
movaway = starnames(speed > 0) 
