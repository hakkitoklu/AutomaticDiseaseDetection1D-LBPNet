function tt=mp(sinyal)
say=1;
for i=1:2:length(sinyal)-1
    tt(say)=max(sinyal(i:i+1));
    say=say+1;
end