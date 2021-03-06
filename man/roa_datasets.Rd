% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/roa_datasets.R
\name{roa_datasets}
\alias{roa_datasets}
\title{Search datasets}
\usage{
roa_datasets(fp7 = NULL, dataset_id = NULL, doi = NULL,
  provider_id = NULL, project_id = NULL, has_project = NULL, oa = NULL,
  title = NULL, author = NULL, from_date = NULL, to_date = NULL,
  size = 1000, sort_by = NULL, sort_order = NULL, format = "tsv", ...)
}
\arguments{
\item{fp7}{Search for dataset associated to a FP7 project with the given
grant number}

\item{dataset_id}{Gets the dataset with the given openaire identifier,
if any}

\item{doi}{Gets the publications with the given DOIs, if any}

\item{provider_id}{Search for datasets by openaire data provider identifier.
Alternatevely, it is possible to repeat the parameter for each provider id.
In both cases, provider identifiers will form a query with OR semantics.}

\item{project_id}{Search for publications by openaire project identifier.
Alternatevely, it is possible to repeat the parameter for each provider id.
In both cases, provider identifiers will form a query with OR semantics.}

\item{has_project}{If hasProject is true gets the datasets that have a link
to a project. If hasProject is false gets the datasets with no links to
projects.}

\item{oa}{Open access or not.}

\item{title}{Publication title}

\item{author}{Search for dataset by authors}

\item{from_date}{Gets the dataset whose date of acceptance is greater than
or equal the given date. Allowed values: date formatted as YYYY-MM-DD.}

\item{to_date}{Gets the dataset whose date of acceptance is less than or
equal the given date. Allowed values: date formatted as YYYY-MM-DD.}

\item{size}{size number of records}

\item{sort_by}{sort field, one of dateofcollection, resultstoragedate,
resultembargoenddate, resultembargoendyear, resultdateofacceptance,
resultacceptanceyear}

\item{sort_order}{sort order. one of ascending or descending. optional}

\item{format}{format to return, one of json, xml, csv or tsv (default)}

\item{...}{curl options passed on to \link[crul:HttpClient]{crul::HttpClient}}
}
\description{
OpenAIRE is collecting the metadata of research datasets
that are related to an open access publication in OpenAIRE or linked
to a funding stream
}
\examples{
\dontrun{
# Search for FP7 grant-supported datasets
res <- roa_datasets(fp7 = "247153", size = 10)
str(res)

# different formats
roa_datasets(title = "methane", size = 3, format = "json")
roa_datasets(title = "methane", size = 3, format = "tsv")
roa_datasets(title = "methane", size = 3, format = "csv")
roa_datasets(title = "methane", size = 3, format = "xml")

# sorting
roa_datasets(sort_by = "dateofcollection", sort_order = "descending", 
  size = 3)
# vs
roa_datasets(sort_by = "dateofcollection", sort_order = "ascending", 
  size = 3)

# curl options
res <- roa_datasets(fp7 = "247153", size = 3, verbose = TRUE)
}
}
\references{
OpenAIRE API docs \url{http://api.openaire.eu/}
}
