L1=9;
L2=9;
L3=10;
min=10;
max=15;
 
L(1)=Link([0 L2 0 pi/2 ]);
L(1).qlim=[0 pi];
L(2)=Link([0 0 L2 pi/2 ]);
L(2).qlim=[0 pi];
L(3)=Link([0 L3 0 0 1]); %%1== prismatic %%0==revolute
L(3).qlim = [min,max];
 
Rob=SerialLink(L);
Rob.name='RRP Arm';
Rob.teach
%% Forward Kinematics

for th=0:0.1*pi:pi
   for d=min:1:max
     Rob.plot([th th d ],'workspace',[-20 20 -20 20 -20 20]);
     pause(0.1)
    end
end

%% Inverse Kinematics

X= input("Enter the value of X_axis for end effector: ");
Y= input("Enter the valueh of Y_axis for end effector: ");
Z= input("Enter the value of Z_axis for end effector: ");

T=transl([X Y Z]);
INV = Rob.ikine(T ,[0 0 0],'mask',[1 1 1 0 0 0]);
figure
Rob.plot(INV)