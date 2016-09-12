%%

% take the first 300 samples (three seconds)
input = getsamples(input, [1:300]);
output = getsamples(output, [1:300]);
% prepare input and output data, with sample time
data = iddata(output.data,input.data,0.01);
% estimate transfer function with 1 pole and no zeros, like with ident
openLoopSys = tfest(data,1,0);

%% compute step response
Ref = 0.5;

s = tf('s');
% the determined transfer function
G = (openLoopSys.num) / ( s * openLoopSys.den(1)  + openLoopSys.den(2))

figure(1);
subplot(121)
rlocus(G);

T = feedback(G,1);
t = 0:0.001:3;
step =  Ref * ones(1,length(t));
[y,t,x] = lsim(T,step,t);
subplot(122)
plot(t,y,'b',t,step,'m')
xlabel('Time (sec)')
ylabel('Amplitude')
title('Step Response: Input-purple, Output-blue')

%% run with compensator

K = 1;
% determined pole and zeros for compensator
zc = 0.1;
pc = 1;
C = K* (s+zc) / (s + pc);

CG = C * G;



figure(1);
subplot(121)
rlocus(CG);

TC = feedback(CG,1);
t = 0:0.001:3;
step =  Ref * ones(1,length(t));
[y,t,x] = lsim(TC,step,t);
subplot(122)
plot(t,y,'b',t,step,'m')
xlabel('Time (sec)')
ylabel('Amplitude')
title('Step Response: Input-purple, Output-blue')

