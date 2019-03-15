if(!require("pacman"))install.packages("pacman")
pacman::p_load("here", "tidyverse", "fs")

#----sim-data----
files <- tibble(paths = dir_ls("data"))
files <- mutate(files,
                files = map(paths, read_tsv,
                            col_types = cols(.default = col_double())),
                t = str_extract(paths, "t\\d.tsv") %>% str_extract("\\d"),
                id = str_extract(paths, "id\\d*t") %>% str_extract("\\d\\d?"))
eeg <- files %>% select(-paths) %>% unnest()
