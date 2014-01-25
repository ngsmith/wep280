figure;
hold on;

axis([0 mapDimensions(1) 0 mapDimensions(2)])



for i = 1:size(samples,1)
    plot( samples(1), samples(2), 'r.', 'MarkerSize', samples(4) );
    
end

%plot(samples(:,1), samples(:,2),'r.', 'MarkerSize', samples(:,4));
plot(wayPoints(:,1), wayPoints(:,2),'go');    
plot(currentWayPoint(1), currentWayPoint(2),'.','Color',[34/255,139/255,34/255],'MarkerSize',40, 'LineWidth', 2);    
text(wayPoints(:,1), wayPoints(:,2), num2str( wayPoints(:,3) ), 'VerticalAlignment','bottom','HorizontalAlignment','right');


plot(currentPose(1), currentPose(2),'b*','MarkerSize',8, 'LineWidth', 2);    
arrowSize = 20;
h = quiver(currentPose(1), currentPose(2), arrowSize* cos(currentPose(3)), arrowSize* sin(currentPose(3)), 5);
%sonarX = 1 + currentPose(1) + (cos(sonarResults(:,2)+currentPose(3)) .* sonarResults(:,1));
%sonarY = 2 + currentPose(2) + (sin(sonarResults(:,2)+currentPose(3)) .* sonarResults(:,1));
sonarX = 1 + currentPose(1) + (cos(sonarResults(:,2)) .* sonarResults(:,1));
sonarY = 2 + currentPose(2) + (sin(sonarResults(:,2)) .* sonarResults(:,1));
plot( sonarX, sonarY, 'b.' );
