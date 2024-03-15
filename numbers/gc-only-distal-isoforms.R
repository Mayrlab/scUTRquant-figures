library(tidyverse)
library(magrittr)
library(readxl)

## human
df_hcl <- read_xlsx("output/tables/Suppl_Table1.xlsx")

df_hcl %>%
  group_by(gene_id) %>%
  mutate(is_distal=utr_pos == max(utr_pos)) %>%
  ungroup() %>%
  mutate(class=case_when(
    is_novel ~ "UTRome",
    n_celltypes_tx == 0 ~ "GENCODE Only",
    n_celltypes_tx > 0 ~ "Common",
    TRUE ~ NA_character_
  )) %>%
  ggplot(aes(x=class, fill=cs_usage_class)) +
  geom_bar() +
  facet_wrap(vars(is_distal)) +
  theme_bw()

df_hcl %>%
  group_by(gene_id) %>%
  mutate(is_distal=utr_pos == max(utr_pos)) %>%
  ungroup() %>%
  mutate(class=case_when(
    is_novel ~ "UTRome",
    n_celltypes_tx == 0 ~ "GENCODE Only",
    n_celltypes_tx > 0 ~ "Common",
    TRUE ~ NA_character_
  )) %>%
  filter(class == "GENCODE Only", is_distal, n_celltypes_gene > 0) %>%
  distinct(gene_id) %>%
  nrow() %>%
  sprintf(fmt="%d human genes where a distal isoform is GENCODE-only.")


## mouse
df_mca <- read_xlsx("output/tables/Suppl_Table2.xlsx")

df_mca %>%
  group_by(gene_id) %>%
  mutate(is_distal=utr_pos == max(utr_pos)) %>%
  ungroup() %>%
  mutate(class=case_when(
    is_novel ~ "UTRome",
    n_celltypes_tx == 0 ~ "GENCODE Only",
    n_celltypes_tx > 0 ~ "Common",
    TRUE ~ NA_character_
  )) %>%
  ggplot(aes(x=class, fill=cs_usage_class)) +
  geom_bar() +
  facet_wrap(vars(is_distal)) +
  theme_bw()

df_mca %>%
  group_by(gene_id) %>%
  mutate(is_distal=utr_pos == max(utr_pos)) %>%
  ungroup() %>%
  mutate(class=case_when(
    is_novel ~ "UTRome",
    n_celltypes_tx == 0 ~ "GENCODE Only",
    n_celltypes_tx > 0 ~ "Common",
    TRUE ~ NA_character_
  )) %>%
  filter(class == "GENCODE Only", is_distal, n_celltypes_gene > 0) %>%
  distinct(gene_id) %>%
  nrow() %>%
  sprintf(fmt="%d mouse genes where a distal isoform is GENCODE-only.")


