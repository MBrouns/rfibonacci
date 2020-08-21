#' This calculates the nth fibonacci number
#'
#' @param n positive integer indicating the fibonacci number you want to compute
#'
#' @return integer, the nth fibonacci number
#' @export
#' @importFrom logging getLogger
#' @import logging
#'
#' @examples
#' fibo(1)  # 1
#' fibo(3)  # 2
fibo <- function(n) {

  logger <- getLogger('fibonacci.fibo')
  logger$info('calculating fibo(%d)', n)

  if (n < 1) {
    logger$warn('fibo was called with a negative number')
    stop('n should be geq 1')
  }
  if (n == 1 || n == 2) {
    logger$debug('falling back to base fibo condition')
    return(1)
  }
  hello()
  logger$debug('recursively computing fibo')
  return(fibo(n-1) + fibo(n-2))

}
