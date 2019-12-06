function histo=bp(sinyal)
histo=zeros(1,256);
for i=1:length(sinyal)-8
    blok=sinyal(i:i+8);
    ys(i)=0; say=0;
    for j=1:9
        if j~=5
            if blok(j)-blok(5)>=0
                ys(i)=ys(i)+1*2^say;
            end
            say=say+1;
        end
    end
    histo(ys(i)+1)=histo(ys(i)+1)+1;
end