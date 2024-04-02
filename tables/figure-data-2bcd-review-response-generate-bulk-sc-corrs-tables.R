library(tidyverse)
library(magrittr)
library(gtsummary)

## HSC data
df_ds <- read_tsv("output/tables/tbl-hspcs-bulk-sc-corrs-wholesample-downsampled.tsv")

df_ds %>%
  tbl_summary(by=type, include=rho_TPM)

df_ws <- read_tsv("output/tables/tbl-hspcs-bulk-sc-corrs-wholesample.tsv")

df_ws %>%
  tbl_summary(by=type, include=rho_TPM)

df_orig <- read_tsv("output/tables/tbl-hspcs-bulk-sc-corrs.tsv")

df_orig %>%
  gtsummary::tbl_summary(by=type, include=rho_TPM)

full_join(df_ws, df_ds, by=c("sample1", "sample2", "type"), 
          suffix=c(".original", ".downsampled")) %>%
  select(type, rho_TPM.original, rho_TPM.downsampled) %>%
  rename_with(~ str_remove(.x, "rho_TPM."), starts_with("rho")) %>%
  tbl_summary(by=type, include=c(original, downsampled), 
              type=everything() ~ "continuous", 
              digits=everything() ~ 3) %>%
  modify_header(label="**Spearman ρ**")

## mESC data
df_mesc <- read_tsv("output/tables/tbl-mescs-bulk-sc-corrs.tsv")
df_bulk <- read_tsv("output/tables/tbl-mescs-bulk-sc-corrs-sc-as-bulk.tsv")

full_join(df_mesc, df_bulk, by=c("sample1", "sample2", "type"), 
         suffix=c(".original", ".as bulk")) %>%
  select(type, rho_TPM.original, `rho_TPM.as bulk`) %>%
  rename_with(~ str_remove(.x, "rho_TPM."), starts_with("rho")) %>%
  tbl_summary(by=type, include=c(original, `as bulk`), 
              type=everything() ~ "continuous", 
              digits=everything() ~ 3) %>%
  modify_header(label="**Spearman ρ**")

