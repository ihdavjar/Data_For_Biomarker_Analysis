
library(lefser)

org_data<-read.csv("complete_ALL_Cats.csv")
temp_cols_names<-names(org_data)

temp_cols_names<-temp_cols_names[3:length(temp_cols_names)-1]
print(temp_cols_names)

temp_rows_names<-org_data$X
print(temp_rows_names)

col_data<-org_data[1:nrow(org_data),c(3:ncol(org_data)-1)]
print(colnames(col_data))

print(length(temp_cols_names))
temp_assay=t(col_data)
rownames(temp_assay)<-temp_cols_names
colnames(temp_assay)<-temp_rows_names

print(dim(temp_assay))
temp_treatment<-org_data$Treatment

colData <- DataFrame(Treatment=temp_treatment,
                     row.names=temp_rows_names)

print(length(temp_rows_names))

print(temp_treatment)
temp_se<-SummarizedExperiment(assays=list(temp_assay),
                     colData=colData)

## -----------------------------------------------------------------------------
res <- lefser(temp_se, groupCol = "Treatment",lda.threshold = 0)
head(res)


## -----------------------------------------------------------------------------
lefserPlot(res, colors = c("blue","red"),trim.names = TRUE)

## -----------------------------------------------------------------------------

write.csv(res,"output_ALL_Cats.csv")
