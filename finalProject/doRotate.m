function doRobotRotate( r, l, theta, power, doMocks )

if doMocks 
    doMockRotate( r, l, theta, power );
else
    doRobotRotate( r, l, theta, power );
end


