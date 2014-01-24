function [ samples ] = InitializeSamples( initialPose, sampleCount )

    initialSampleRange = 10;
    samples = [;];

    for i = 1:sampleCount
        samples(end+1,: ) = [
            initialPose(1) + floor( (rand() - 0.5) * initialSampleRange)
            initialPose(2) + floor( (rand() - 0.5) * initialSampleRange)
            floor( initialPose(3) + (rand() * (pi/2)) - pi/4 )
            0 % weight
        ];

    end

    samples
end

