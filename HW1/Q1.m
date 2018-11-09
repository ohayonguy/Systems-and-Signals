close all;
clear;
clc;

%% 1
N=4;
A=rand(N);
B=rand(N);

%% 2
C1=A*B;

%% 3
C2=zeros(N,N);
for row = 1 : N
    for col = 1 : N
        for index = 1 : N
            C2(row,col)=C2(row,col)+A(row,index)*B(index,col);
        end
    end
end

%% 4
if norm(C1(:)-C2(:),'Inf') >= 1e-12
    disp("The matrices aren't equal");
end

%% 5
N=1000;
A=rand(N);
B=rand(N);

disp("The result for matlab mult is:");
tic;
C1=A*B;
toc;

disp("The result for the nested loops mult is:");
tic;
C2=zeros(N,N);
for row = 1 : N
    for col = 1 : N
        for index = 1 : N
            C2(row,col)=C2(row,col)+A(row,index)*B(index,col);
        end
    end
end
toc;

