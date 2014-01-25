function [ weights ] = calculateWeights( samples, sonarReadings, map )
    weights = [];
    for i = 1:size(samples,1)
        x = samples(i,1);
        y = samples(i,2);
        weight = measurementModel( x, y, sonarReadings(:,2),sonarReadings(:,1),  map);
       
        weights(end+1) = weight(1);
    end
end

