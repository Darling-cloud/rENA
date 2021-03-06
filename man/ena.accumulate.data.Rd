% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ena.accumulate.data.R
\name{ena.accumulate.data}
\alias{ena.accumulate.data}
\title{Accumulate data from a data frame into a set of adjacency (co-occurrence) vectors}
\usage{
ena.accumulate.data(units = NULL, conversation = NULL, codes = NULL,
  metadata = NULL, model = c("EndPoint", "AccumulatedTrajectory",
  "SeparateTrajectory"), weight.by = "binary",
  window = c("MovingStanzaWindow", "Conversation"), window.size.back = 1,
  window.size.forward = 0, mask = NULL, ...)
}
\arguments{
\item{units}{A data frame where the columns are the properties by which units will be identified}

\item{conversation}{A data frame where the columns are the properties by which conversations will be identified}

\item{codes}{A data frame where the columns are the codes used to create adjacency (co-occurrence) vectors}

\item{metadata}{(optional) A data frame with additional columns of metadata to be associated with each unit in the data}

\item{model}{A character, choices: EndPoint (or E), AccumulatedTrajectory (or A), or SeparateTrajectory (or S); default: EndPoint. Determines the ENA model to be constructed}

\item{weight.by}{(optional) A function to apply to values after accumulation}

\item{window}{A character, choices are Conversation (or C), MovingStanzaWindow (MSW, MS); default MovingStanzaWindow. Determines how stanzas are constructed, which defines how co-occurrences are modeled}

\item{window.size.back}{A positive integer, Inf, or character (INF or Infinite), default: 1. Determines, for each line in the data frame, the number of previous lines in a conversation to include in the stanza window, which defines how co-occurrences are modeled}

\item{window.size.forward}{(optional) A positive integer, Inf, or character (INF or Infinite), default: 0. Determines, for each line in the data frame, the number of subsequent lines in a conversation to include in the stanza window, which defines how co-occurrences are modeled}

\item{mask}{(optional) A binary matrix of size ncol(codes) x ncol(codes). 0s in the mask matrix row i column j indicates that co-occurrence will not be modeled between code i and code j}

\item{...}{additional parameters addressed in inner function}
}
\value{
\code{\link{ENAdata}} object with data [adjacency (co-occurrence) vectors] accumulated from the provided data frames.
}
\description{
This function initializes an ENAdata object, processing conversations from coded data to generate adjacency (co-occurrence) vectors
}
\details{
ENAData objects are created using this function. This accumulation receives
separate data frames for units, codes, conversation, and optionally, metadata. It
iterates through the data to create an adjacency (co-occurrence) vector corresponding
to each unit - or in a trajectory model multiple adjacency (co-occurrence) vectors for
each unit.

In the default MovingStanzaWindow model, co-occurrences between codes are
calculated for each line k in the data between line k and the window.size.back-1 previous
lines and window.size.forward-1 subsequent lines in the same conversation as line k.

In the Conversation model, co-occurrences between codes are calculated across all lines in
each conversation. Adjacency (co-occurrence) vectors are constructed for each unit u by
summing the co-occurrences for the lines that correspond to u.

Options for how the data is accumulated are endpoint, which produces one adjacency (co-occurrence)
vector for each until summing the co-occurrences for all lines, and two trajectory models:
AccumulatedTrajectory and SeparateTrajectory. Trajectory models produce an adjacency
(co-occurrence) model for each conversation for each unit. In a SeparateTrajectory model,
each conversation is modeled as a separate network. In an AccumulatedTrajectory model, the
adjacency (co-occurrence) vector for the current conversation includes the co-occurrences
from all previous conversations in the data.
}
\examples{
data(RS.data)

codeNames = c('Data','Technical.Constraints','Performance.Parameters',
  'Client.and.Consultant.Requests','Design.Reasoning','Collaboration');

accum = ena.accumulate.data(
  units = RS.data[,c("UserName","Condition")],
  conversation = RS.data[,c("Condition","GroupName")],
  metadata = RS.data[,c("CONFIDENCE.Change","CONFIDENCE.Pre","CONFIDENCE.Post")],
  codes = RS.data[,codeNames],
  window.size.back = 4
)

}
\seealso{
\code{\link{ENAdata}}, \code{\link{ena.make.set}}
}
\keyword{accumulate}
\keyword{data,}
