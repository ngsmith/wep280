figure;
hold on;

axis([0 mapDimensions(1) 0 mapDimensions(2)])

plot(samples(:,1), samples(:,2),'r.');
plot(wayPoints(:,1), wayPoints(:,2),'go','MarkerSize',6);    
plot(currentWayPoint(1), currentWayPoint(2),'.','Color',[34/255,139/255,34/255],'MarkerSize',40, 'LineWidth', 2);    
text(wayPoints(:,1), wayPoints(:,2), num2str( wayPoints(:,3) ), 'VerticalAlignment','bottom','HorizontalAlignment','right');


plot(currentPose(1), currentPose(2),'b*','MarkerSize',8, 'LineWidth', 2);    

sonarX = 1 + currentPose(1) + (cos(sonarResults(:,2)+currentPose(3)) .* sonarResults(:,1))
sonarY = 2 + currentPose(2) + (sin(sonarResults(:,2)+currentPose(3)) .* sonarResults(:,1))

plot( sonarX, sonarY, 'b.' );
