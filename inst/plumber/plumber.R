library(plumber)

#* @apiTitle Fibonacci API

#* Endpoint that computes the nth fibonacci number
#* @get /fibo/<n>
function(n){
  fibonacci::fibo(as.numeric(n))
}
