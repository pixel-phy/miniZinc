% Variables
var float: R = 2600.0; %quarterly repayment
var float: P = 10000.0; %principal initially borrowed
var 0.0 .. 2.0: I = 0.04; % interes rate
% intermediate variables
var float: B1; % balance after one quarter
var float: B2; % balance after two quaerters
var float: B3; % balance after three quarters
var float: B4; % balance at end

constraint B1 = P * (1.0 + I) - R;
constraint B2 = B1 * (1.0 + I) - R;
constraint B3 = B2 * (1.0 + I) - R;
constraint B4 = B3 * (1.0 + I) - R;

solve satisfy;

