% verify that the RWTH - Mindstorms NXT toolbox is installed.
if verLessThan('RWTHMindstormsNXT', '3.00');
    error(strcat('This program requires the RWTH - Mindstorms NXT Toolbox ' ...
        ,'version 3.00 or greater. Go to http://www.mindstorms.rwth-aachen.de ' ...
        ,'and follow the installation instructions!'));
end


%% Clear and close
COM_CloseNXT all
clear all
close all


%% Open Bluetooth connetion
%h = COM_OpenNXT('bluetooth32.ini');
global h;
user = 'garth';

if(user == 'garth')
h =COM_OpenNXTEx('Any', '00:16:53:18:80:b3', 'bluetooth_next2.ini');
else if(user == 'neil')
h =COM_OpenNXTEx('Any', '00165315C5D3', 'bluetoothNeil.ini');
    end

COM_SetDefaultNXT(h);    

sonarMotor = NXTMotor(MOTOR_A);
sonarMotor.ResetPosition();

