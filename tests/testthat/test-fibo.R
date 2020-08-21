test_that("the output of fibonacci is a number", {
  expect_identical(fibo(1), as.numeric(fibo(1)))
})

test_that("the base fibonacci numbers are correct", {
  expect_identical(fibo(1), 1)
  expect_identical(fibo(2), 1)
})

test_that("negative fibonacci numbers don't exist", {
  expect_error(fibo(-1))
})

test_that("fibo(n) is fibo(n-1) + fibo(n-2)", {
  for (n in 3:6) {
    expect_equal(fibo(n), fibo(n-1) + fibo(n-2))
  }
})
