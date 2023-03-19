function patterns = autoEncoder(p, nHidden, path)

nInput = size(p, 1);
eta = 0.001;

nTrials = 500;
nItems = size(p,2);

W = randn(nInput, nHidden) / sqrt(nInput);

%%% training phase
cnt = 0;
error = zeros(nTrials, 1);
for i = 1:nTrials
    
    order = randperm(nItems);
    
    for j = 1:nItems
        
        [hidden, ~, deviation] = feedForward(p(:,order(j)), W);
        W = W + eta * deviation * hidden;
        error(i) = error(i) + sqrt(mean((deviation.^2)));
        
    end
    
    error(i) = error(i) / nItems;
    
    if (mod(i, 10) == 0)
        disp(append("Epoch number: ", num2str(i), "/", num2str(nTrials)))
    end
    
    if (i > 1)
        if (abs(error(i) - error(i-1)) < 10^(-5))
            disp("Learning phase finished before full iteration.")
            break
        end
    end
    
end

figure(2)
plot(1:i, error(1:i))
saveas(gcf,'multivariatepdf\plots\error.png')

%%% extracting the patterns
patterns = zeros(nItems, nHidden);
for i = 1:nItems
    
    [hidden, ~, ~] = feedForward(p(:,i), W);
    patterns(i,:) = hidden / norm(hidden);
    
end

% save those patterns in an external .txt file
fid = fopen('data\hiddenVectors.txt','w');
for i = 1:size(patterns,1)
    fprintf(fid,'%g\t',patterns(i,:));
    fprintf(fid,'\n');
end
fclose(fid);

end

