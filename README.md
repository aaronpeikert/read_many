# read_many
Simple demonstration for reading many tsv files (e.g. eeg files from brain vision analyzer).

# write.R
Simulates a data.frame with columns E1 ... E64, and with 1000 rows, sampled from standard normal, for 100 persons for two measurement occasions. Each of these resulting 200 data.frames is then written to the directory "data" amounting in roughly 25MB text files.

# read.R
Reads all files from the "data" directory (resulting from `write.R`), infers the id and measurement occasion from the file name and saves the to columns. Then all data.frames are unnested, resulting in a big data.frame with 20000 rows and 66 cols (id + t = measurement occasion + E1...E64).
