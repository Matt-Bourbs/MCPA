function[] = PA3()

n = 10; %number of electrons
timeStep = 1; %amount of time between updates
force = 1e-24; %force on particle
m0 = 9.11e-31; %electron mass
dt = 1;
Tau = 20;
P = 1-exp(-dt/Tau); %probability of scatter (0.05 in this case)
time = 0;

Px = zeros(n,1);
Py = zeros(n,1);
v = zeros(n,1);


for i = 1:100
 
    v = v+(force/m0)*timeStep; %initial velocity
   
    %determine whether to scatter
    randMin = 0;
    randMax = 1;
    r = (randMax-randMin).*rand(n,1);
    
    id = (r <= P);
        v(id) = 0;
       
    %calculate new position
    Px = Px + v*timeStep;
    Py = Py + v*timeStep;
  
    %calculate drift velocity
    v_drift = mean(v);
    
    %calculate time
    time = time+timeStep;
    
    figure(1)
    subplot(2,2,1:2)
    plot(Px,Py,'o')
    title(['Drift Velocity: ',num2str(v_drift,3),'m/s']);
    xlabel('Time (s)');
    ylabel('Velocity (m/s)');
    hold on
    
    subplot(2,2,3:4)
    plot(time, v,'o')
    title('Position');
    ylabel('Position (m)');
    xlabel('Time (s)');
    hold on
    
end

end