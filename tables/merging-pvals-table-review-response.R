library(tidyverse)
library(magrittr)
library(gt)

df_pvals <- tibble(
  comparison=c("Neutro vs HSC", "ODC vs OPC", "TraEpi vs TraMes"),
  unmerged=c(0.228277172, 0.00189981, 0.114388561),
  merged=c(0.0469953, 0.675532447, 0.080591941),
  combined=c(0.248175182, 0.02859714, 0.02789721)
)

df_pvals %>%
  gt(rowname_col="comparison") %>%
  tab_spanner(label=md("**p-value (chi-squared test)**"),
              columns=2:4) %>%
  cols_label(.list=list(unmerged=md("**Unmerged**"), 
                        merged=md("**Merged**"), 
                        combined=md("**Combined**"))) %>%
  fmt_number(decimals=3)

