a1=1;
a2=5;
a3=5;

syms d1 th2 th3

L(1)=Link([0 0 0 0 1 a1]);
L(1).qlim=[0 5];

L(2)=Link([0 0 a2 0 0]);
L(2).qlim=[-90 90];

L(3)=Link([0 0 a3 0 0]);
L(3).qlim=[-90 90];

Robo=SerialLink (L);
Robo.name='PRR';
figure(1)
Robo.plot([0 0 0],'workspace',[-10 10 -10 10 -5 5])
Robo.teach
Robo

X= input("Enter the value of X_axis for end effector in range(0:10): ");
Y= input("Enter the value of Y_axis for end effector in range(0:10): ");
Z= input("Enter the value of Z_axis for end effector in range(1:5): ");


T=transl([X Y Z]);
INV = Robo.ikine(T ,[0 0 0],'mask',[1 1 1 0 0 0])
figure(2)
Robo.plot(INV)
          
