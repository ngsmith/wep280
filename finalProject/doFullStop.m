function doFullStop( doMocks  )
%% Constants and so on

if ~ doMocks 
    Ports = [MOTOR_B; MOTOR_C];  % motorports for left and right wheel

    %% Initialize motor-object for straight line movement:
    mStraight                   = NXTMotor(Ports);
    mStraight.Stop('off');
end 
