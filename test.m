clc,clear all,close all
dosya=dir('path');
for k=1:length(dosya)
    [y,fs]=audioread(dosya(k).name);
    p1=mp(y); p2=mp(p1); p3=mp(p2); p4=mp(p3); p5=mp(p4); p6=mp(p5);
    p7=mp(p6);
    
    oz(k,1:256)=bp(y); oz(k,256*1+1:256*2)=bp(p1);
    oz(k,256*2+1:256*3)=bp(p2); oz(k,256*3+1:256*4)=bp(p3);
    oz(k,256*4+1:256*5)=bp(p4); oz(k,256*5+1:256*6)=bp(p5);
    oz(k,256*6+1:256*7)=bp(p6); oz(k,256*7+1:256*8)=bp(p7);
    
    if dosya(k).name(1)=='c'
        oz(k,2049)=1;
    else
        oz(k,2049)=0;
    end
end
% Ozellik normalizasyon

for i=1:2048
    X(:,i)=(oz(:,i)-min(oz(:,i)))/((max(oz(:,i))-min(oz(:,i)))+eps);
end

%Agirliklarin hesaplanmasi

y=oz(:,2049);
[a,b]=relieff(X,y,10);

%Agirlik degeri bos yada negatif ise 0 yap)

for i=1:2048
    if isnan(b(i))
        b(i)=0;
    end
    if b(i)<0
        b(i)=0;
    end
end

%Ozellik indirgemesi

for j=1:309
sayac=1;
for i=1:16:2048
    blok=X(j,i:i+15);
    w=b(i:i+15);
    pay=sum(blok.*w);
    payda=sum(w);
    ioz(j,sayac)=pay/payda;
    sayac=sayac+1;
end
end

ioz(:,sayac)=y;
    
    
    
    
    
