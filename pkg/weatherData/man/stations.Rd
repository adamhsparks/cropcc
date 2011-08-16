\name{stations}
\docType{data}
\alias{stations}
\title{Data for weather stations, GSOD data}
\description{
This is a cleaned version of the original GSOD weather station data (National Climatic Data Center, Global Summary of Day).
}
\usage{data(stations)}
\format{
data frame}
\source{
The data are derived from this file:
ftp://ftp.ncdc.noaa.gov/pub/data/gsod/ish-history.csv

This file has some missing data for altitude and some other problems.
A clean version of this dataset is provided here.

The following changes were made.

1. All variables were converted to SI units.

2. Some stations were removed from the set, because of impossible coordinates.

3. Altitude data were checked and corrected where necessary.
We looked up the altitude of the stations using the SRTM data (Jarvis et al. 2008).

We changed the altitude to the SRTM altitude when stations had either:

a) an original altitude of 0 and a difference with the SRTM altitude of more than 15 percent.

b) an original altitude of more than 0 and a difference with the SRTM altitude of more than 50 m.


Users of these data should take into account the following (from the NCDC website):

"The following data and products may have conditions placed on their international commercial use. 
They can be used within the U.S. or for non-commercial international activities without restriction. 
The non-U.S. data cannot be redistributed for commercial purposes.
Re-distribution of these data by others must provide this same notification."
}
\references{
http://www.ncdc.noaa.gov/cgi-bin/res40.pl?page=gsod.html

Jarvis A., H.I. Reuter, A.  Nelson, E. Guevara, 2008, Hole-filled  seamless SRTM
data V4, International  Centre for Tropical  Agriculture (CIAT), available  from
http://srtm.csi.cgiar.org.
}
\keyword{datasets}