function SlowdownToRealtime(deltat)
condition = true;
while condition
    if (toc >= deltat)
        condition = false;
    end
end
tic