% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/post-list.R
\name{post_list}
\alias{post_list}
\title{Manage Twitter lists}
\usage{
post_list(
  users = NULL,
  name = NULL,
  description = NULL,
  private = FALSE,
  destroy = FALSE,
  list_id = NULL,
  slug = NULL,
  token = NULL
)
}
\arguments{
\item{users}{Character vectors of users to be added to list.}

\item{name}{Name of new list to create.}

\item{description}{Optional, description of list (single character string).}

\item{private}{Logical indicating whether created list should be private.
Defaults to false, meaning the list would be public. Not applicable if list
already exists.}

\item{destroy}{Logical indicating whether to delete a list. Either \code{list_id} or
\code{slug} must be provided if \code{destroy = TRUE}.}

\item{list_id}{Optional, numeric ID of list.}

\item{slug}{Optional, list slug.}

\item{token}{Expert use only. Use this to override authentication for
a single API call. In most cases you are better off changing the
default for all calls. See \code{\link[=auth_as]{auth_as()}} for details.}
}
\value{
Response object from HTTP request.
}
\description{
Create, add users, and destroy Twitter lists
}
\examples{
\dontrun{

## R related Twitter accounts
users <- c("_R_Foundation", "R_dev_news", "rweekly_live", "RConsortium", "rstats4ds",
  "icymi_r", "rstatstweet", "RLadiesGlobal")

## create r-accounts list with 8 total users
(r_lst <- post_list(users,
  "r-accounts", description = "R related accounts"))

## view list in browser
browseURL(sprintf("https://twitter.com/\%s/lists/r-accounts",
  rtweet:::api_screen_name()))

## search for more rstats users
r_users <- search_users("rstats", n = 200)

## filter and select more users to add to list
more_users <- r_users$screen_name[r_users$verified]

## add more users to list- note: can only add up to 100 at a time
post_list(users = more_users, slug = "r-accounts")

## view updated list in browser (should be around 100 users)
browseURL(sprintf("https://twitter.com/\%s/lists/r-accounts",
  rtweet:::api_screen_name()))

drop_users <- "icymi_r"

## drop these users from the R list
post_list(users = drop_users, slug = "r-accounts",
  destroy = TRUE)

## view updated list in browser (should be around 100 users)
browseURL(sprintf("https://twitter.com/\%s/lists/r-accounts",
  rtweet:::api_screen_name()))

## delete list entirely
post_list(slug = "r-accounts", destroy = TRUE)

}
}
\references{
Create: \url{https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-create}
Destroy: \url{https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-destroy}
Add users: \url{https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-create},
\url{https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-create_all}
Remove users: \url{https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy},
\url{https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy_all}
}
