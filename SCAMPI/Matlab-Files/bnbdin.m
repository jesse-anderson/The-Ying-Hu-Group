gn=(nn-1)*cov(bn);
gd=(dd-1)*cov(bd);
bne=[bd;bn];
gp=(nn+dd-1)*cov(bne);
aa=gp-gn-gd;
bb=gn+gd;
[V D]=eig(aa,bb);
vc=V(:,8);
zn=bn*vc;
zd=bd*vc;
mn=mean(zn);
sn=std(zn);
md=mean(zd);
sd=std(zd);
x1=min([mn md]);
if mn<md
    x2=x1-4*sn;
else
    x2=x1-4*sd;
end
x3=max([mn md]);
if mn>md
    x4=x3+3*sn;
else
    x4=x3+3*sd;
end
x=x2:.01:x4;
plot(x,normpdf(x,mn,sn),'k')
hold on
plot(x,normpdf(x,md,sd),'k')
pm=max([normpdf(x,mn,sn),normpdf(x,md,sd)]);
axis([x2 x4 0 pm]);
stem(zn,normpdf(zn,mn,sn),'ko')
stem(zd,normpdf(zd,md,sd),'k*')





