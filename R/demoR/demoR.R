## The actual logic is in this file. Now this contains a PCA and plotting function,
## used by server.R.

dopca <- function(data) {
  s <- svd(cov(data))
  w <- s$u
  ## normalize w so that the mean of PCA vectors is positive
  w <- w*(rep(1,dim(w)[1]) %o%
            (apply(w,2,
                   function(x) if(mean(x)>=0) 1/sqrt(sum(x^2)) else -1/sqrt(sum(x^2)))))
  p <- order(s$d,decreasing=TRUE)
  list(w=w[,p],v=s$d[p])
}

plotdata <- function(data,current) {
  w <- current$w[,1:2] # Projection vectors
  v <- current$v[1:2]  # Projection costs
  xy <- data$r %*% w
  idx <- 1:dim(xy)[1] %in% current$s
  pch <- 0:(length(levels(data$f[[1]]))-1)
  plot(xy,
       col=ifelse(idx,"red","black"),
       pch=pch[data$f[[1]]],
       bty="n",
       xlab=sprintf("PC1[%.2g] = %s",
                    v[1],largestdim(w[,1],names=colnames(data$r))),
       ylab=sprintf("PC2[%.2g] = %s",
                    v[2],largestdim(w[,2],names=colnames(data$r))))
  legend("topright",
         legend=levels(data$f[[1]]),
         pch=pch)
}

#' Makes a character string of a numeric vector
#'
#' @param x numeric vector
#' @return string representation of the vector
#'
#' @export
largestdim <- function(x,names=as.character(1:length(x)),s="") {
  p <- order(abs(x),decreasing=TRUE)[1:min(5,length(x))]
  paste(mapply(function(y,n) sprintf("%+.2f (%s)",y,n),x[p],names[p]),
        collapse=" ")
}

preprocess <- function(origdata) {
  ## r is the real valued part of the data
  r <- as.matrix(origdata[,!sapply(origdata,is.factor)])
  ## subsets are the factors
  fn <- colnames(origdata)[sapply(origdata,is.factor)]
  if(length(fn)>0) {
    f <- lapply(fn,function(s) origdata[,s])
    names(f) <- fn
  } else {
    f <- list()
  }
  list(r=r,f=f)
}
