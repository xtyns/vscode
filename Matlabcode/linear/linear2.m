clear,clc
T=[15,18,21,24;19,23,22,18;26,17,16,19;19,21,23,17];
Aeq=ones(4,4);beq=ones(4,1);
fmin=max(max(T));
for i=1:1:10^5
x=rand(4,4)>=0.5;
 if sum(x,2)==ones(4,1) & sum(x,1)==ones(1,4)

  fval=max(max(T.*x));


 if fmin >= fval
  fmin=fval;

 end
 end
end
disp(fmin)

for i=1:1:10^5
x=rand(4,4)>=0.5;
 if sum(x,2)==ones(4,1) & sum(x,1)==ones(1,4)
  fval=max(max(T.*x));
 if fmin == fval
  disp("one posible 'x' version:");disp(x);
  disp("one posible 'integrate time' version:");disp(sum(sum(T.*x,2)));

 end
 end
end