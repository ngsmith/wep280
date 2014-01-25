function [ arrived ] = arrivedAtWaypoint( distance, theta )

    distanceTolerance = 5;
    thetaTolerance = pi/8;
    
    arrived = ( abs( distance ) < distanceTolerance ) && ( abs( theta ) < thetaTolerance );

end

