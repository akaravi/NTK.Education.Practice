function retOut = fact(n)
    if n == 0
        retOut = 1 
    else
        retOut = n * fact(n - 1)
    end
end

fact(300)