function sim = cosSim(x, y)

sim = dot(x, y) / (sqrt(sum(x.^2)) .*  sqrt(sum(y.^2)));

end