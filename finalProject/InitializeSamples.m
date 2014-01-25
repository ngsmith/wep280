function [ samples ] = InitializeSamples( initialPose, sampleCount )

    initialSampleRange = 200;
    samples = [;];
    samples(end+1,:) = [ initialPose(1) initialPose(2) initialPose(3) 0];
    for i = 2:sampleCount
        samples(end+1,: ) = [
            initialPose(1) + floor( (rand() - 0.5) * initialSampleRange)
            initialPose(2) + floor( (rand() - 0.5) * initialSampleRange)
            initialPose(3) + (rand() * (pi/2)) - pi/4
            0 % weight
        ];

    end
    samples;


end

