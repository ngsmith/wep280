function [ mapBorder ] = getMapBorder( map )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
mapBorder = [];
[r,c] = size(map);
for idr = 1:r
    for idc = 1:c
        if(map(idr,idc) == 1)
            %Store border in 1x2
            mapBorder(end+1,1) = idr;
            mapBorder(end,2) = idc;
        end
    end
end

end

