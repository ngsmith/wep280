clear all;
close all;

currentPose = [200, 200, 0 ];

map = imread( 'map.jpg' );
map = im2bw( map );
sonarReadings = getMockSonarResults( map, currentPose, -pi/4, pi/2, 180 )

figure;
axis( [0,395,0, 396] );
hold on;

currentPose;

X = 1 + currentPose(1) + (cos(sonarReadings(:,2)+currentPose(3)) .* sonarReadings(:,1));
Y = 2 + currentPose(2) + (sin(sonarReadings(:,2)+currentPose(3)) .* sonarReadings(:,1));

plot( X, Y, 'r.' );
