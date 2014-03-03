the Data
========================
```{coffee}
response <- c(66, 63, 65, 59, 62, 56, 55, 51, 0, 0, 0, 0)
treatment <- c('t1', 't1', 't1',
               't2', 't2', 't2', 
               't3', 't3', 't3',
               't4', 't4', 't4')
rinfect <- c('gl', 'gl', 'gl', 'gl',
             'my', 'my', 'my', 'my',
             'no', 'no', 'no', 'no')
mydata <- data.frame(response, treatment, rinfect)
mydata

#OUTPUT
   response treatment rinfect
1        66        t1      gl
2        63        t1      gl
3        65        t1      gl
4        59        t2      gl
5        62        t2      my
6        56        t2      my
7        55        t3      my
8        51        t3      my
9         0        t3      no
10        0        t4      no
11        0        t4      no
12        0        t4      no
```

### the Model
```{coffee}
fit <- anova(lm(response ~ treatment + rinfect, data=mydata))
fit

#OUTPUT
Analysis of Variance Table

Response: response
          Df Sum Sq Mean Sq F value    Pr(>F)    
treatment  3 7772.9 2590.97  506.93 1.326e-07 ***
rinfect    2 1872.7  936.33  183.20 4.183e-06 ***
Residuals  6   30.7    5.11                      
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```
