if(!require("pacman"))install.packages("pacman")
pacman::p_load("here", "tidyverse", "fs")

#----sim-data----
sim_eeg <- function(trials, electrodes){
  out <- replicate(electrodes, rnorm(trials), simplify = FALSE)
  names(out) <- str_c("E", seq_along(out))
  out <- as.data.frame(out)
  out
}

eeg1 <- tibble(id = 1:100, eeg = map(id, ~sim_eeg(1000, 64)))
eeg2 <- tibble(id = 1:100, eeg = map(id, ~sim_eeg(1000, 64)))

dir_create("data")
walk2(eeg1$id, eeg1$eeg, ~write_tsv(.y, path("data", str_c("eeg_id", .x, "t1.tsv"))))
walk2(eeg2$id, eeg2$eeg, ~write_tsv(.y, path("data", str_c("eeg_id", .x, "t2.tsv"))))
