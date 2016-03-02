library(knitcitations)
# read mendeley bibtex file
bib <- read.bibtex("~/Dropbox/Dissertation.Writing/Thesis/library.bib", check = FALSE)

# ad hoc fix
for(bibkey in c("FitbitMET")){
  bib[  bibkey  ]$url <- gsub("\\{\\\\_\\}","_", bib[  bibkey  ]$url)
}


###References to fix URLS

Fitbit

