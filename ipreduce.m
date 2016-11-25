function image = ipreduce(image, levels)

factor = 256 / levels; 
image = image ./ factor;
image = image .* factor;

end