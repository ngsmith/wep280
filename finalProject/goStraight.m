function goStraight( r, l, d, power, doMocks )

if ~doMocks
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here

    tacho = 1273;
    phi = d/r;
    tacho = 360 * phi / (2 * pi);
    tacho = floor(tacho);


    %% Constants and so on
    Ports = [MOTOR_B; MOTOR_C];  % motorports for left and right wheel

    %% Initialize motor-object for straight line movement:
    mStraight                   = NXTMotor(Ports);
    % next command since we are driving in SYNC-mode. This should not be
    % necessary with correct default values, but at the moment, I have to set
    % it manually,
    mStraight.SpeedRegulation   = false;  % not for sync mode
    mStraight.Power             = power;
    mStraight.TachoLimit        = tacho;
    mStraight.ActionAtTachoLimit = 'coast';

    %send command
    mStraight.SendToNXT();
    mStraight.WaitFor();
    mStraight.Stop('off');
end


