Simulation Problem
=====================

I. Let α = 0.05

   1. Draw a sample of size n = 35 ~ N(µ = 3, σ2 =  4), Assume σ2 unknown.
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
  tab <- matrix(NA, nrow = R, ncol = 3)
  colnames(tab) <- c("Statistics", "p-value", "Descision")
  
  # Loop the process for 100 times
  for(i in 1:R){
    # Generate random samples from Normal Distribution
    # with mean = Mu and standard deviation = S
    d <- rnorm(n = n, mean = Mu, sd = S)
    
    # Compute the test statistics using t-test
    # note that for large sample, z-test can be
    # approximated with t-test. The null hypothesis is
    # that the mu is equal to 3.
    z <- t.test(d, mu = Mu)
  
    # Take the decision, if the p-value is less than 0.05,
    # Reject the null hypothesis
    if(z$p.value < alpha){
      desc[i] <- 1
      tab[i, 3] <- "Reject"
    }
    # Otherwise, do not reject the null hypothesis
    if(z$p.value > alpha){
      desc[i] <- 0
      tab[i, 3] <- "Do not Reject"
    }
    # The decision will be incorrect when it rejects
    # the null hypothesis, since we know that the true parameter
    # of mu is 3.
    
    # Extract the statistic computed
    tab[i, 1] <- z$statistic
    
    # Extract the p-value computed
    tab[i, 2] <- z$p.value
  }
  
  tab <- as.data.frame(tab)
  
  # Return the output
  return(list(Table = tab, "Sum of Incorrect Decisions" = sum(desc) / R))
}

# For I, the answer is
confirm.alpha()

# For II, the answer is
confirm.alpha(n = 20)
```
