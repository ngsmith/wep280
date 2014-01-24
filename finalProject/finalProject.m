close all;

im = imread( 'map.jpg');
map = im2bw(im);

initialX = 100;
initialY = 100;
initialTheta = 0;
initialRange = 10;

wayPoints = [10 10; 20 40; 99 15];

currentPathStep = 1;

currentWayPoint = wayPoints( 1,:);

samplesEnumX = 1;
samplesEnumY = 2;

samplesEnumTheta = 3;
samplesEnumWeight = 4;

mapSizeX = 200;
mapSizeY = 200;

nSamples = 20;

samples = zeros( nSamples,4 );

figure;
hold on;
axis([0 mapSizeX 0 mapSizeY])
for i = 1:nSamples
    samples(i,samplesEnumX ) = initialX + floor( (rand() - 0.5) * initialRange);
    samples(i,samplesEnumY ) = initialY + floor( (rand() - 0.5) * initialRange);
    samples(i,samplesEnumTheta ) = floor( rand() * 2 * pi );
    samples(i,samplesEnumWeight ) = 0;
 
    plot(samples(i,samplesEnumX),samples(i,samplesEnumY),'r*');   
end
plot(initialX, initialY,'b.');    
plot(currentWayPoint(1),currentWayPoint(2),'go');    

for i = 1:nSamples
  %  probabilites = applyMotionModel( samples(i,samplesEnumX),samples(i,samplesEnumY), samples(i,samplesEnumTheta), z,  map)
    %    measurement_model(samples(i,samplesEnumX),samples(i,samplesEnumY), samples(i,samplesEnumTheta), z,  map)
end


 localizationInterval = 100;
 nextLocalization = localizationInterval;
 
 %while( ~done )
     deltaX = 1.5;
     deltaY = 1.5;
     deltaTheta = pi/16;
     
     [sonarResults,  sonarThetas] = getStubSonarResults( map, initialX, initialY, initialTheta );
     for i = 1: 180
        x = cos( sonarThetas( i )) * sonarResults( i ) + initialX;
        y = sin( sonarThetas( i )) * sonarResults( i ) + initialY;
        
        x, y, sonarResults( i )
        plot( x, y ); 

     end
%     
%     generateOdometryModelSamples();
%     
% %    if( reachedTarget ) 
% %        setTargetNextTarget();        
% %    end
%     nextLocalization = nextLocalization - 1;
%     if( nextLocalization  <= 0 )
%         nextLocalization = localizationInterval;
%         
%         % stop moving
%         doFullStop();
%         setLocation = doLocalization();
%         setCourseTo( currentTarget );
%     end
% end
