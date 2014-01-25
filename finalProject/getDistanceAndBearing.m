function [ distance, bearing ] = getDistanceAndBearing( currentPose, targetPose )
    deltaX = currentPose(1) - targetPose(1);
    deltaY = currentPose(2) - targetPose(2);
    bearing = inRange(currentPose(3) - targetPose(3));
    
    distance = sqrt( deltaX^2 + deltaY^2 );  % just pythagorus
end

