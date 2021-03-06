
clear variables;
clear global;
close all;

%InitializeRobot;

doMocks = true;


[mapImage, mapDimensions, wayPoints] = InitializeMap();

currentPose = [200 200 0];

%Estimate Initial Pose
doInitPose = false;

% if(doInitPose)
%     sonarInitResults = getSonarResults(currentPose, false);
%     %Triangulate based on comparison with map
%     %
% end

r = 2.7;
l = 6;
rotatePower = 20;
forwardPower = 30;

currentPathStep = 1;
currentWayPoint = wayPoints( 1,:);

samplesEnumX = 1;
samplesEnumY = 2;

samplesEnumTheta = 3;
samplesEnumWeight = 4;

numSamples = 4;

samples = InitializeSamples( currentPose, numSamples ) ;

sonarResults = getSonarResults( currentPose, doMocks );

mapBorder = [];
if(false)
mapBorder = getMapBorder(mapImage);
end

dumpState;

localizationInterval = 20;
nextLocalization = localizationInterval;

arrivedAtFinalDestination = false;
done = false;
iteration = 0;
maxIterations = 100


while (iteration < maxIterations ) && (~done)
    
    
    iteration = iteration + 1
    nextLocalization = nextLocalization - 1
    currentPathStep
    currentPose, currentWayPoint
    [distance, bearing] = getDistanceAndBearing( currentPose, currentWayPoint)  % just pythagorus
    
    %% first let's see if we are at a waywpint or the final destination
    if( arrivedAtWayPoint( distance, bearing ) )
        'arrived at wayPoint'
        
        if currentPathStep > size(wayPoints,1)
            'arrived at final Destination'
            arrivedAtFinalDestination = true;
            done = true;  % a seperate done flag leave room to exit on conditions where we never arriaved at the final destination
        else
            'set new current waypoint'

            currentPathStep = currentPathStep + 1
            currentWayPoint = wayPoints( currentPathStep )
        end
    end
    
    if ~done 
        % OK We are on the way to our next way point
        if( nextLocalization <= 0 )  %timeToLocalize
            'time to localize'
            doFullStop( doMocks );
            
            nextLocalization = localizationInterval;
            
            currentPose = performLocalization( currentPose, samples, mapImage, doMocks );
            [distance, bearing] = getDistanceAndBearing( currentPose, currentWayPoint);  % just pythagorus

            % so we localized and guessed our new position.  Let's set
            % bearing and speed to the target waypoint
            doRotate( r, l, bearing, rotatePower, doMocks );
            
            goStraight( r, l, distance, forwardPower, doMocks ); % speed, distance 
            dumpState();
        end
    end

    
    % mock only
    distance = 1;
    currentPose(1) = currentPose(1) + cos(currentPose(3)) * distance;
    currentPose(2) = currentPose(2) + sin(currentPose(3)) * distance;
    currentPose(3) = inRange(currentPose(3) + pi / 90);

            
    
end;