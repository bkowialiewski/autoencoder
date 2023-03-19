function launch()

addpath('multivariatepdf\functions')

n = 55;
nHidden = 251;
sigma = 0.0005;

% generate the original vectors and plot their similarity
p = genVectors(n, sigma);
disp(size(p))
f = figure(1);
f.Position = [500 500 1000 400];
subplot(1,2,1)
patternCheck(p)

% generate those from the autoencoder
p = autoEncoder(p, nHidden, path);
figure(1)
subplot(1,2,2)
patternCheck(p)

end