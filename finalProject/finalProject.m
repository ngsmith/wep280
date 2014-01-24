close all;

[mapImage, mapDimensions, currentPose, wayPoints] = InitializeMap();


InitializeSamples( currentPose, mapDimensions );

currentPathStep = 1;
currentWayPoint = wayPoints( 1,:);

samplesEnumX = 1;
samplesEnumY = 2;

samplesEnumTheta = 3;
samplesEnumWeight = 4;

mapSizeX = 200;
mapSizeY = 200;

numSamples = 20;

samples = InitializeSamples( currentPose, numSamples ) ;


sonarResults = getMockSonarResults( mapImage, currentPose, -pi/4, pi/2, 180 );

dumpState;


%faceCurrentWayPoint();
%moveForward( 10 );





%for i = 1:nSamples
%   probabilites = applyMotionModel( samples(i,1),samples(i,2), samples(i,3), z,  map)
    %    measurement_model(samples(i,samplesEnumX),samples(i,samplesEnumY), samples(i,samplesEnumTheta), z,  map)
%end


%localizationInterval = 100;
%nextLocalization = localizationInterval;


      deltaX = -50;
      deltaY = -50;
      deltaTheta = 0;
    
      [samples(:,1), samples(:,2), samples(:,3)] = motionModel( samples(:,1), samples(:,2), samples(:,3), deltaX, deltaY, deltaTheta, numSamples ); 
      currentPose(1) = samples(1,1);
      currentPose(2) = samples(1,2);
      currentPose(3) = samples(1,3);
      currentPose(1) = 100;
      currentPose(2) = 100;
      currentPose(3) = 0;

      sonarResults = getMockSonarResults( mapImage, currentPose, -pi/4, pi/2, 180 );

      dumpState();

      
      
%while( ~done )
%      deltaX = 1.5;
%      deltaY = 1.5;
%      deltaTheta = pi/16;
    
%      [samples(:,1), samples(:,2), samples(:,3)] = motionModel( samples(:,1), samples(:,2), samples(:,3), deltaX, deltaY, deltaTheta ); 
%      dumpState();
      
%      
%      [sonarResults,  sonarThetas] = getStubSonarResults( map, initialX, initialY, initialTheta );
%      for i = 1: 180
%         x = cos( sonarThetas( i )) * sonarResults( i ) + initialX;
%         y = sin( sonarThetas( i )) * sonarResults( i ) + initialY;
%         
%         x, y, sonarResults( i )
%         plot( x, y ); 
% 
%      end
%     
%     generateOdometryModelSamples();
%     
% %    if( reachedTarget ) 
% %        setTargetNextTarget();        
% %    end
%     nextLocalization = nextLocalization - 1;
%     if( nextLocalization  <= 0 )
%         nextLocalization = localizationInterval;
         
         % stop moving
%         doFullStop();
%         setLocation = doLocalization();
%         setCourseTo( currentTarget );
%     end
% end
