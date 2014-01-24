function [ ultraSoundReadings, ultraSoundThetas  ] = getMockSonarResults( map, x, y, scanStartTheta, scanEndTheta )
    stepSize = 2*pi / 360;
    perturbance = 25; 
    scanTheta = scanStartTheta;
    ultraSoundReadings = [];
    ultraSoundThetas = [];
    while scanTheta < scanEndTheta
        if(5==2)
        ultraSoundReadings(end+1) = castraysingle( x, y, scanTheta, map, 1000 ) + ( perturbance * (rand() -0.5));
        else
            ultraSoundReadings(end+1) = castraysingle( x, y, scanTheta, map, 1000 );
        end
        ultraSoundThetas(end+1) = scanTheta; 
        scanTheta = scanTheta + stepSize
        end
end

