clear all;
clc;
disp('Mccullough Pitts Neuron Model');
disp('Enter Weights');
w1=input('Weight 1:');
w2=input('Weight 2:');
theta=input('Threshold:');
y=zeros(1,4);
x1=[0 0 1 1];
x2=[0 1 0 1];
z=[0 0 0 1];
con=1;
while con
  zin=x1*w1+x2*w2;
  for i=1:4
    if zin(i)>=theta
      y(i)=1;
    else
      y(i)=0;
    end
  end
  disp('Output of Net:');
  disp(y);
  if y==z
    con=0;
  else
    disp('Net is not learning enter other set of weights:');
      w1=input('Weight 1:');
      w2=input('Weight 2:');
      theta=input('Threshold:');
  end
end
disp('Mccullough Pitts Neuron model answer-')
disp('Weight 1:');
disp(w1);
disp('Weight 2:');
disp(w2);
disp('Threshold:');
disp(theta);
