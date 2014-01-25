function [ sonarResults ] = getSonarResults( currentPose, doMocks )

if doMocks 
    sonarResults = getMockSonarResults( im2bw(imread( 'map.jpg')), currentPose, -pi/2, pi, 10 );
else
    sonarResults = doRobotScan( currentPose, 50  );  % request 50 results
end
    

end

