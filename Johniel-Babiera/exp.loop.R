exp.loop <- function(size, rate = 1){
  r.samples <- rexp(n = size, rate = rate)
  while(sum(r.samples) >= 460){
    r.samples <- rexp(n = size, rate = rate)
  }
  return(r.samples)
}
