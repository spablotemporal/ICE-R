#' Function to bootstrap the data
#' 
#' @param data A data.frame that is going to be bootstrapped.
#' @param strata The name of the column that indicates the stratification groups.
#' @param N_Sim Number of bootstraps.
#' @export
Boot_sample <- function(data, strata, N_Sim = 1000){
  # data = data; strata = 'tx'; N_Sim = 10
  bs_l <- lapply(1:N_Sim, function(x){
    df_l <- split(data, data[strata])
    lapply(df_l, function(x){
      i <- sample(x = 1:nrow(x), size = nrow(x), replace = T)
      S <- x[i,]
    }) %>%
      do.call(rbind,.)
  })
  return(bs_l)
}
