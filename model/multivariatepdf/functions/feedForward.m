function [hidden, output, deviation] = feedForward(input, W)

hidden = input' * W;
output =  W * hidden';
deviation = input - output;

end