% Function to reduce the number of intensity levels, from 256 to 2 in integers of 2
% Function takes an image and the intensity level as arguments
function image = ipreduce(image, levels)

factor = 256 / levels; 
image = image ./ factor;
image = image .* factor;

end