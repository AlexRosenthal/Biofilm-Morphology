N=3;
S=zeros(N,N,N);
for i=1:N;
    for j=1:N;
        for k=1:N
  S(i,j,k)=sqrt((i-2).^2+(j-2).^2+(k-2).^2);
        end;
    end;
end
B=S<=1;

