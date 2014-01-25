function goForward( power, doMocks )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if ~doMocks

    %% Constants and so on
    Ports = [MOTOR_B; MOTOR_C];  % motorports for left and right wheel

    %% Initialize motor-object for straight line movement:
    mStraight                   = NXTMotor(Ports);
    mStraight.SpeedRegulation   = false;  % not for sync mode
    mStraight.Power             = power;
    mStraight.TachoLimit        = 0;
    mStraight.ActionAtTachoLimit = 'coast';

    %send command
    mStraight.SendToNXT();
    %mStraight.WaitFor();
    %mStraight.Stop('off');

end