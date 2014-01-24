function [ map, dimensions, pose, wayPoints] = InitializeMap( )

    map = im2bw(imread( 'map.jpg'));
    dimensions = [400 400];
    pose = [200 200 0];
    
    wayPoints = [];
    for( i = 1:10 ) 
        wayPoints(end+1,:) = [floor( rand() * dimensions(1)), floor( rand() * dimensions(2)),i];
        
    end

end

