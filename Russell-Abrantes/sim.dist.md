Simulated Distributions
=====
The [sim.dist](https://github.com/alstat/anstoiitstat/blob/master/Russell-Abrantes/sim.dist.R) function simulates `size` observations for 5 continuous probability distributions namely,

1. Normal;
2. Exponential;
3. Gamma;
4. Chi-square; and
5. Beta

Each simulated distributions are looped into `obs.dist` variables. The usage of the `sim.dist` function is,
```coffee
sim.dist <- function(obs.dist,
                     size, 
                     norm.mean = 0, 
                     norm.sd = 1, 
                     expo.rate = 1, 
                     gamm.shape = 2,
                     chis.df = 1,
                     beta.shape1 = 5,
                     beta.shape2 = 1)
```
So to simulate 5000 observations for every 10 variables of each distribution, we code it this way
```coffee
sim.dist(obs.dist = 10, size = 5000)
```
Output will return 50 variables in total, with 10 variables Normal, another 10 variables for Exponential, and so on. Other arguments such as `norm.mean` and `norm.sd` are the mean and standard deviation of the random samples from Normal distribution with default value 0 and 1, respectively; the `expo.rate` is the rate of the Exponential distribution; then others are self-explanatory.

The `sim.dist` has the following structure
```coffee
sim.dist <- function(obs.dist,
                     size, 
                     norm.mean = 0, 
                     norm.sd = 1, 
                     expo.rate = 1, 
                     gamm.shape = 2,
                     chis.df = 1,
                     beta.shape1 = 5,
                     beta.shape2 = 1){
#Normal
norm.dist <- matrix(NA, nr = obs.dist, nc = size)
#Exponential
expo.dist <- matrix(NA, nr = obs.dist, nc = size)
#Gamma
gamm.dist <- matrix(NA, nr = obs.dist, nc = size)
#Chi-square
chis.dist <- matrix(NA, nr = obs.dist, nc = size)
#Beta
beta.dist <- matrix(NA, nr = obs.dist, nc = size)

for(i in 1:obs.dist){
  norm.dist[i,] <- rnorm(n = size, mean = norm.mean, sd = norm.sd)
  expo.dist[i,] <- rexp(n = size, rate = expo.rate)
  gamm.dist[i,] <- rgamma(n = size, shape = gamm.shape)
  chis.dist[i,] <- rchisq(n = size, df = chis.df)
  beta.dist[i,] <- rbeta(n = size, shape1 = beta.shape1, shape2 = beta.shape2)
}

norm.var <- t(norm.dist)
expo.var <- t(expo.dist)
gamm.var <- t(gamm.dist)
chis.var <- t(chis.dist)
beta.var <- t(beta.dist)

d.frame <- data.frame(norm.var, expo.var, gamm.var, chis.var, beta.var)
names(d.frame) <- c(paste("Norm.Var", 1:obs.dist, sep = ""),
                    paste("Expo.Var", 1:obs.dist, sep = ""),
                    paste("Gamm.Var", 1:obs.dist, sep = ""),
                    paste("Chis.Var", 1:obs.dist, sep = ""),
                    paste("Beta.Var", 1:obs.dist, sep = ""))
return(d.frame)
}
```
Download this code [here](https://github.com/alstat/anstoiitstat/blob/master/Russell-Abrantes/sim.dist.R). For problems please send an [issue](https://github.com/alstat/anstoiitstat/issues).
