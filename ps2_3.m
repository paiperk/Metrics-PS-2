%part a
%define variables
nitt = 10000 %nuber of itterations
n = 100 %number of observations
x= ones(n,2);
bhat = zeros(2, nitt);
chi2 = 3

for i=1:nitt
    z=chi2rnd(chi2,n,1);
    x(:,2)=z(:,1);
    error=(rand(n,1)-1/2)*2;
    y=1+x(:,2)*0.5+error;
    x2 = x'*x;
    xy= x'*y;
    bhat(:,i)=inv(x2)*(xy);
end

display("the average B0 hat is")
mean(bhat(1,:))

display("the average B1 hat is")
mean(bhat(2,:))
display("end")

%Part b

%n=100 calculated above 
histogram(bhat(1,:))
histogram(bhat(2,:))

n = 1000
x= ones(n,2);

for i=1:nitt
    z=chi2rnd(chi2,n,1);
    x(:,2)=z(:,1);
    error=(rand(n,1)-1/2)*2;
    y=1+x(:,2)*0.5+error;
    x2 = x'*x;
    xy= x'*y;
    bhat(:,i)=inv(x2)*(xy);
end
histogram(bhat(1,:))
histogram(bhat(2,:))

n = 10000
x= ones(n,2);

for i=1:nitt
    z=chi2rnd(chi2,n,1);
    x(:,2)=z(:,1);
    error=(rand(n,1)-1/2)*2;
    y=1+x(:,2)*0.5+error;
    x2 = x'*x;
    xy= x'*y;
    bhat(:,i)=inv(x2)*(xy);
end
histogram(bhat(1,:))
histogram(bhat(2,:))
display("end")

%part c
xmax=4
xmin=-4
bhatt = bhat';


p = normcdf(linspace(xmin,xmax,n));
xdist = linspace(xmin,xmax,n)/sqrt(18*n)+.5;
bhatsort = sort(bhatt(:,2));

plot(xdist,p)
title('Normal CDF')

plot(bhatsort,1/nitt:1/nitt:1)
title('Beta 1 CDF')

display("end")

%part d

n = 10000
x= ones(n,2);
r=zeros(n,1);
sig2=zeros(nitt,1);
for i=1:nitt
    z=chi2rnd(chi2,n,1);
    x(:,2)=z(:,1);
    error=(rand(n,1)-1/2)*2;
    y=1+x(:,2)*0.5+error;
    x2 = x'*x;
    xy= x'*y;333
    bhatd=inv(x2)*(xy);
    xb = x*bhatd;
    r = y-xb;
    r2 = r'*r;
    sig2(i,1)=r2/(n-2);
end
histogram(sig2)
mean(sig2)