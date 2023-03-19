function p = genVectors(n, sigma)

% create coordinates
x = 0:(1/(n-1)):1;
y = x;

[X, Y] = meshgrid(x, y);
Z = [X(:) Y(:)];

p = zeros(length(x)^2, length(x)^2);

% generate the pdf distribution
cnt = 0;
for i = 1:length(x)
    
    for j = 1:length(y)
        
        cnt = cnt+1;
        p(:,cnt) = mvnpdf(Z, [x(i), y(j)], [sigma,0;0,sigma]);
        
    end
    
end

% normalize them (range 0-1)
p = p ./ max(max(p));

% save those vectors in a text file
fid = fopen('data\originalVectors.txt','wt');
for i = 1:size(p,1)
    fprintf(fid,'%g\t',p(i,:));
    fprintf(fid,'\n');
end
fclose(fid);

end