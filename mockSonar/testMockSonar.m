clear all;
close all;

x = 100;
y = 200;

map = imread( 'map.jpg' );
map = im2bw( map );
[ a, b ] = getMockSonarResults( map, x, y, 0, 2*pi );

figure;
axis( [0,395,0, 396] );
hold on;

X = 1 + x + (cos(b) .* a);
Y = 2 + y + (sin(b) .* a);

%Get Map Border
getMap = 1;
if(getMap == 1)
 mapBorder = [];
 [r,c] = size(map);
 for idr = 1:r
     for idc = 1:c
         if(map(idr,idc) == 1)
           %Store border in 1x2 Array (x,y)
           mapBorder(end+1,1) = idr;
           mapBorder(end,2) = idc;
           %plot(idr,idc, 'g.');
         end
         %m = m+1;
     end
 end
end

%Plot Map
plotMap = 1;
if(plotMap ==1)
    [rows columns] = size(mapBorder);
    for i = 1:rows
        plot(mapBorder(i,1),mapBorder(i,2), 'g.');
    end
end
%........................

%Show expected position on Map
plot(x,y, 'b.');
%Show sonar reading on Map
plot( X, Y, 'r.' );
