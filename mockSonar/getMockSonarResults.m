function [ ultraSoundReadings ] = getMockSonarResults( map, pose, scanStartTheta, scanRange, scanSteps )
    maxRange = 225;
    stepSize = scanRange / scanSteps;
    perturbance = 0; 
    ultraSoundReadings = [];
    for step = 1:scanSteps
        sonarTheta = (step * stepSize) + scanStartTheta;
        inertialTheta = pose(3) + sonarTheta;
        castRayResult = castraysingle( pose(1), pose(2), inertialTheta, map, maxRange );
        if castRayResult < 1
            castRayResult = maxRange;
        else
            castRayResult = castRayResult + ( perturbance * (rand() -0.5));
            if castRayResult > maxRange
                castRayResult = maxRange;
            end
        end
        ultraSoundReadings(end+1,:) = [ castRayResult, inRange(sonarTheta+pose(3)) ]; 
     end
end

