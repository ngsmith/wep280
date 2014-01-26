Connect;

%%Map variables
A = imread('mymaze_1.jpg');%%each pixel = 1mm
map_bw = im2bw(A,0.5);
imshow(map_bw)
hold on


%% initial position and destination
%poseInitial = [20 ; 20 ;  pi/2];  % examples:[-30,-30,0],[-30,30,0],[-30,-30,pi/4],[-30,30,pi/4],[-30,-30,pi]


%% Constants
l = 6;  % cm
r = 2.7; % cm
N = 100+1; %Number of samples

%% inital deltaX, deltaY, deltaTheta are equal to poseInitial
%x(1) is the real position from odomentry, the rest are the probabilistic
%values
%% inital deltaX, deltaY, deltaTheta are equal to poseInitial
x(1) = poseInitial(1); %deltaX
y(1) = poseInitial(2); %deltaY
theta(1) = poseInitial(3);           

%% Initiating map_x map_y and map_theta
map_x(1:100) = poseInitial(1);
map_y(1:100) = poseInitial(2);
map_theta(1:100) = poseInitial(3);


x(2:100) = x(1);
y(2:100) = y(1);
theta(2:100) = theta(1);
prob(2:100) = 1/99;

for mm = 2:100
myX(mm,1) = x(mm);
myX(mm,2) = y(mm);
myX(mm,3) = theta(mm);
myX(mm,4) = prob(mm);
end


%%initial positions with errors
for mm = 2:100
x(mm) = x(1);
y(mm) = y(1);

%% add random error to poseinitial 2:100 
x(mm) = x(1) +  1*(2*(rand-.5));
y(mm) = y(1) +  1*(2*(rand-.5));
theta(mm) = theta(1) + (.1*(rand-.5));
prob(mm) = 1/100;

%% global coordinates initialized
map_x(mm) = x(mm);
map_y(mm) = y(mm) ;
map_theta(mm) = theta(mm);

plot(map_x(mm),map_y(mm), '.r','MarkerSize', 1)

%State array 2:100
X(mm,1:4) = [x(mm),y(mm),theta(mm), prob(mm)];

end

%% Initial Plots
plot(x(1), y(1), '.','MarkerSize', 10);
pdx = fitdist(x(2:100)','Normal');
pdy = fitdist(y(2:100)','Normal');
probX= -(pdx.mu);
probY = -(pdy.mu);
plot(probX,probY, '.w','MarkerSize', 12);

ang=0:0.01:2*pi; 
xp=pdx.sigma*cos(ang)*1;
yp=pdy.sigma*sin(ang)*1;
plot(probX+xp,probY+yp,'w');


% Rotational alphas
a1 = 0.05;
a2 = 0.05;
% Translational alphas
a3 = .02;
a4 = 0.02;

%% controller constants
k =  [3 8 -1.5]; %rho,alpha,beta

%%initialize array
TIME(1) = 0;
inc     = 0.01;


%% create wheel models
mA                    = NXTMotor(MOTOR_A);
mA.SpeedRegulation    = true;  % not for sync mode
mA.ActionAtTachoLimit = 'coast';
mA.TachoLimit = 180;

Ports = [MOTOR_B; MOTOR_C];
mB                    = NXTMotor(Ports(1));
mB.SpeedRegulation    = true;  % not for sync mode
mB.ActionAtTachoLimit = 'coast';
mB.TachoLimit = 0;

mC                    = NXTMotor(Ports(2));
mC.SpeedRegulation    = true;  % not for sync mode
mC.ActionAtTachoLimit = 'coast';
mC.TachoLimit = 0;

%%make initial readings
Encoder_B_b = NXT_GetOutputState(MOTOR_B);
Encoder_C_b = NXT_GetOutputState(MOTOR_C);


%% Initialize ultrasonic sensor
OpenUltrasonic(3);

%% Pre - Main Loop
%%figure,hold on
targetReached = false;
m             = 2;
counter       = 0;