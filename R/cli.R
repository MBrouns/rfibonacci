#! /usr/local/bin/Rscript

if (sys.nframe() ==  0) {

  parser <- argparse::ArgumentParser()

  parser$add_argument('-v', '--verbose',
                      action='store_true',
                      default=FALSE,
                      help='prints extra output if specified')

  parser$add_argument('-p', '--port',
                      type='integer',
                      default=8000,
                      help='the port on which to expose our api'
                      )
  parser$add_argument('-b', '--bind',
                      default="127.0.0.1")

  args <- parser$parse_args()

  if (args$verbose) {
    level <- 'DEBUG'
  } else  {
    level <- 'INFO'
  }
  logging::basicConfig(level = level)
  logger <- logging::getLogger('fibonacci.cli')

  plumber_file <- system.file(
    "plumber",
    package = "fibonacci",
    mustWork = TRUE
  )
  logger$info("loading plumber api definition from %s", plumber_file)

  plumber::plumb(dir = plumber_file)$run(host = args$bind, port = args$port, swagger = TRUE)

}
