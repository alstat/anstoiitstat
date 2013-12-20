Algorithm
========

1. Generate random samples from exponential distribution;
2. take the sum of the random samples;
3. if the sum is less than 460, return the samples;
4. else back to Step 1 until sum is 460.

R Function
========
```{coffee}
exp.loop <- function(size, rate = 1){
  r.samples <- rexp(n = size, rate = rate)
  while(sum(r.samples) >= 460){
    r.samples <- rexp(n = size, rate = rate)
  }
  return(r.samples)
}
```
---
Example
========
```{coffee}
a <- exp.loop(400)
```
Take the sum to check if it is less than 460, `sum(a)`. Now, generating samples with size 500, will likely to sum up more than 460. Try this,
```{coffee}
sum(rexp(500))
```
Compare the result with `exp.loop`
```{coffee}
sum(exp.loop(500))
```
However, looping will take long for sample size starting at `600`, due to lesser chance of obtaining a sample that is less than 460.
