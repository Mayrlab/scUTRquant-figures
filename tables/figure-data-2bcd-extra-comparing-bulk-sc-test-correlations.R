library(tidyverse)

TSV_CELLTYPE <- "output/tables/tbl-hspcs-bulk-sc-corrs.tsv"
TSV_WHOLE <- "output/tables/tbl-hspcs-bulk-sc-corrs-wholesample.tsv"

df_celltype <- read_tsv(TSV_CELLTYPE)
df_whole <- read_tsv(TSV_WHOLE)

df_combined <- full_join(
  x=read_tsv(TSV_CELLTYPE),
  y=read_tsv(TSV_WHOLE), 
  by=c("sample1", "sample2",  "type"),
  suffix=c("_celltype", "_whole"))

## should be no difference
filter(df_combined, type=='bulk-bulk') %$%
  t.test(rho_TPM_celltype, rho_TPM_whole, paired=TRUE)

filter(df_combined, type=='bulk-sc') %$%
  t.test(rho_TPM_celltype, rho_TPM_whole, paired=TRUE)

filter(df_combined, type=='sc-sc') %$%
  t.test(rho_TPM_celltype, rho_TPM_whole, paired=TRUE)

#########################
########################

## Deduplication Results

TSV_UMIS <- "output/tables/tbl-mescs-bulk-sc-corrs.tsv"
TSV_READS <- "output/tables/tbl-mescs-bulk-sc-corrs-sc-as-bulk.tsv"

df_combined2 <- full_join(
  x=read_tsv(TSV_UMIS),
  y=read_tsv(TSV_READS), 
  by=c("sample1", "sample2",  "type"),
  suffix=c("_umis", "_reads"))

## should be no difference
filter(df_combined2, type=='bulk-bulk') %$%
  t.test(rho_TPM_umis, rho_TPM_reads, paired=TRUE)

filter(df_combined2, type=='bulk-sc') %$%
  t.test(rho_TPM_umis, rho_TPM_reads, paired=TRUE)

filter(df_combined2, type=='sc-sc') %$%
  t.test(rho_TPM_umis, rho_TPM_reads, paired=TRUE)
