\name{dlply}
\alias{dlply}
\title{Split data frame, apply function, and return results in a list.}
\usage{dlply(.data, .variables, .fun, ..., .progress="none",
    .drop=TRUE, .parallel=FALSE)}

\description{
  Split data frame, apply function, and return results in a
  list. For each subset of a data frame, apply function
  then combine results into a list
}

\details{
  All plyr functions use the same split-apply-combine
  strategy: they split the input into simpler pieces, apply
  \code{.fun} to each piece, and then combine the pieces
  into a single data structure.  This function splits data
  frames by variables and combines the result into a list.
  If there are no results, then this function will return a
  list of length 0 (\code{list()}).

  \code{dlply} is similar to \code{\link{by}} except that
  the results are returned in a different format.
}
\keyword{manip}
\value{if results are atomic with same type and dimensionality, a vector, matrix or array; otherwise, a list-array (a list with dimensions)}
\arguments{
  \item{.data}{data frame to be processed}
  \item{.variables}{variables to split data frame by, as quoted variables, a formula or character vector}
  \item{.fun}{function to apply to each piece}
  \item{...}{other arguments passed on to \code{.fun}}
  \item{.progress}{name of the progress bar to use, see \code{\link{create_progress_bar}}}
  \item{.drop}{should combinations of variables that do not appear in the 
data be preserved (FALSE) or dropped (TRUE, default)}
  \item{.parallel}{if \code{TRUE}, apply function in parallel, using parallel 
backend provided by foreach}
}
\examples{linmod <- function(df) lm(rbi ~ year, data = mutate(df, year = year - min(year)))
models <- dlply(baseball, .(id), linmod)
models[[1]]

coef <- ldply(models, coef)
with(coef, plot(`(Intercept)`, year))
qual <- laply(models, function(mod) summary(mod)$r.squared)
hist(qual)}
