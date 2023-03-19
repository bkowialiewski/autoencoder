function patternCheck(p)

nPatterns = size(p,1);

indItem = round(nPatterns/2);

% compute the dot product between the central pattern and all the others
distance = zeros(nPatterns, 1);
for i = 1:nPatterns
    distance(i) = dot(p(i,:), p(indItem,:));
end

distance = reshape(distance, [sqrt(nPatterns), sqrt(nPatterns)]);

imagesc(distance)
saveas(gcf,'multivariatepdf\plots\pattern.png')

end