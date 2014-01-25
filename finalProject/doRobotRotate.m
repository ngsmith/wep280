function doRobotRotate( r, l, theta, power )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

tacho = 1273;
phi = l*theta/r;
tacho = 360 * phi / (2 * pi);
tacho = floor(tacho)
if( tacho ) < 0 
    power = -1 * power

end;

%% Constants and so on
Ports = [MOTOR_B; MOTOR_C];  % motorports for left and right wheel

%% create Seperate motor models
mB                    = NXTMotor(Ports(1)); %choose which motor from port
mB.SpeedRegulation    = true;  % Regulates speed to match input power value
mB.ActionAtTachoLimit = 'coast';
mB.TachoLimit = abs(tacho);
mB.Power = power; %negative sign means the motor will do a 360 degrees in the NEGATIVE direction

mC                    = NXTMotor(Ports(2));
mC.SpeedRegulation    = true;  % not for sync mode
mC.ActionAtTachoLimit = 'coast';
mC.TachoLimit = abs(tacho);
mC.Power = -power; %Positive sign means the motor will do a 360 degrees in the Positive direction

mB.SendToNXT();
mC.SendToNXT();
mB.WaitFor();
mC.WaitFor();
mB.Stop('off');
mC.Stop('off');




