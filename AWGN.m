
% Tausworthe Seeds
s0 = fi(2, 0, 32, 0);
s1 = fi(7, 0, 32, 0);
s2 = fi(5, 0, 32, 0);
b0 = fi(0, 0, 32, 0);
b1 = fi(0, 0, 32, 0);
b2 = fi(0, 0, 32, 0);

%Taus Output
Taus = fi(0, 0, 32, 0);

%Taus Constants
a= fi(4294967294, 0, 32, 0);
b= fi(4294967288, 0, 32, 0);
c= fi(4294967280, 0, 32, 0);

%Log Input
    U0 = fi(0, 0, 48, 48);
%Sin/Cos Input
    U1 = fi(0, 0, 16, 16);

    e = fi(0, 0, 31, 24); % Log output
    f = fi(0, 0, 17, 13); % Sqrt output
    g0 = fi(0, 1, 16,15); % Sin output
    g1 = fi(0, 1, 16,15); % Cos output
    x0 = fi(0, 1, 16, 11); % AWGN output
    x1 = fi(0, 1, 16, 11); % AWGN output

    
for i=1:1000       %Get 1000 Sampl
    
    b0 = bitror(bitxor(bitrol(s0, 13), s0),19);
    s0 = bitxor(bitrol(bitand(s0,a),12),b0);

    b1 = bitror(bitxor(bitrol(s1, 2), s1),25);
    s1 = bitxor(bitrol(bitand(s1,b),4),b1);

    b2 = bitror(bitxor(bitrol(s2, 3), s2),11);
    s2 = bitxor(bitrol(bitand(s2,c),17),b2);
    
    Taus = bitxor(bitxor(s0,s1),s2);
    
    %URNG = Taus.bin;
    U0.bin = [Taus.bin, Taus.bin(17:32)];
    U1.bin = Taus.bin(1:16);
    
    %LOGARITHM BLOCK
    e.data = (-2) * log(U0.data);
    
    %SquareRoot Block
    f.data = sqrt(e.data);
    
    %Sin and Cos
    g0.data = sin(2*pi*U1.data);
    g1.data = cos(2*pi*U1.data);
    
    %Multiplication
    x0.data = f.data .* g0.data;
    x1.data = f.data .* g1.data;
    
    X(i,1) = x0.data;
    X0Binary (i,:) = x0.bin;
    X1Binary (i,:) = x1.bin;
    %X(i,2) = x1.data;
end

histogram(X)


