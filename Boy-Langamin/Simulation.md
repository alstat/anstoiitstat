Simulation Problem
=====================

I. Let α = 0.05

   1. Draw a sample of size n = 35  ~N(µ = 3, σ2 =  4), Assume  σ2 unknown.
   2. Compute  z
   3. Decision
   4. Determine if decision is correct or incorrect.
   5. Run the above steps N = 100 times and determine the percentage of making an incorrect decision. Is this close to 0.05?

II. Do the previous problem with n = 20, σ2 unknown and t.

Solution
===
```{coffee}
# The Function
confirm.alpha <- function(n = 35, Mu = 3, S = sqrt(4), alpha = 0.05, R = 100){
  desc <- numeric()
  for(i in 1:R){
    d <- rnorm(n = n, mean = Mu, sd = S)
    z <- t.test(d, mu = Mu)
    
    if(z$p.value < alpha)
      desc[i] <- 1
    if(z$p.value > alpha)
      desc[i] <- 0
  }
  return(sum(desc) / R)
}

# For I, the answer is
confirm.alpha()

# For II, the answer is
confirm.alpha(n = 20)
```
