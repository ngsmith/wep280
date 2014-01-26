%% Connects to the robot over bluetooth

%% Check toolbox installation
% verify that the RWTH - Mindstorms NXT toolbox is installed.
if verLessThan('RWTHMindstormsNXT', '3.00');
    error(strcat('This program requires the RWTH - Mindstorms NXT Toolbox ' ...
        ,'version 3.00 or greater. Go to http://www.mindstorms.rwth-aachen.de ' ...
        ,'and follow the installation instructions!'));
end%if

%% Clear and close
COM_CloseNXT all


%% Open Bluetooth connetion
%h = COM_OpenNXT(); %for 32 bit
%h =COM_OpenNXTEx('Any', '00165315C85B', 'bluetooth.ini');
h =COM_OpenNXTEx('Any', '00165315C5D3', 'bluetoothNeil.ini');
COM_SetDefaultNXT(h);