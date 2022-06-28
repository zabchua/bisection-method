//BISECTION METHOD

// Declare the function
function f=f(x)     
    f= x^3 + 2*x^2 -x - 1
endfunction

//true value
tv=0.80193773580483825247220463901489010

imax=50

init="      "

// 1. Choose lower xl and upper xu guesses for the root such that the function changes sign over the interval. This can be checked by ensuring that f(xl)*f(xu)<0.
xl=0
xu=1

es=0.0001

// Table Header
mprintf("\n Iteration   xl \t xu \t\t xr \t\t ea \t\t et")

// Iterations
for i=1:imax
    // 2. An estimate of the root xr is determined by
    x=(xl+xu)/2
    
    // True error
    et=abs((tv-x)/tv)*100
    
    // Display iteration
    if(i>1)then
        ea=abs((x-xrold)/x)*100
        mprintf("\n %d \t   %.7f \t %.7f \t %.7f \t %.4f \t %.4f", i, xl, xu, x, ea, et)
        if (ea<es) then
            break
        end
    else
        mprintf("\n %d \t   %.7f \t %.7f \t %.7f \t %s \t %.4f", i, xl, xu, x, init, et)
    end
    
    // 3. Make the following evaluations:
    // 3.1 if f(xl)*f(xr)<0, then the root lies in the lower subinterval. Set xu=xr then return to step 2
    if (f(xl)*f(x)<0)then  
        xu=x
    // 3.2 if f(xl)*f(xr)>0, then the root lies in the uppet subinterval. Set xl=xr then return to step 2
    elseif (f(xl)*f(x)>0)then
        xl=x
    // 3.3 if f(xl)*f(xr)=0, then the root equals xr; terminate the computation
    else
        break
    end
    xrold=x
end
printf("\n\nThe root is %.4f", x)
