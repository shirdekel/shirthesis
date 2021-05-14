#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines. From
## https://github.com/jennybc/googlesheets/blob/3c40561f92f54c451708d7fa5782161da1ed27e0/R/googlesheets.R#L15-L16.
## Also added other definitions
if (getRversion() >= "2.15.1") {
    utils::globalVariables(c(
        ".", "presentation",
        "current_response",
        "distribution"
    ))
}
