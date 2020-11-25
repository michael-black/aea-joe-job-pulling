rm(list = ls())
if (!require('pacman')) install.packages('pacman')
pacman::p_load(tidyverse, readxl)

today = Sys.Date()
yesterday = today - 1 # change '1' to the duration of days since you last checked 
one_week = today + 7 # one week out
one_week_y = yesterday + 7 # one week out
joe_filename = paste0("joe_", today, ".xls") 
joe_filename_y = paste0("joe_", yesterday, ".xls") 

# Replace the download file url to the current address. 
download.file("https://www.aeaweb.org/joe/resultset_xls_output.php?mode=xls_xml&q=eNplj9EKwjAMRf8lzxPGHvcBguA_hK6NM9qlkLTKGPt3K1IRfEvOvQn3bnBmyyzzMekC4wYs6HzmB8EoJcYO7rQ-kwY0cuqvjRpVU5K23ii2kc1KPYahH_pDP0AHSXlmcfH0p_hUJOuKSvPPM3MPCnhJMZBag95J4OAyoXl1yxS_AZU8ScYkcW0ofjoZ1uCkOFWhFqssl3dqdLDvL5GuWHc", 
	destfile = joe_filename)

jobs_today = read_excel(joe_filename) %>% 
mutate(deadline = as.Date(Application_deadline)) %>%
#filter(jp_section %in% c(<string>)),
	#!str_detect(str_to_lower(jp_title), "<string>"),
	deadline >= one_week) %>% # this excludes jobs with deadlines in under a week
arrange(deadline)

## Uncomment this line to write the initial list of jobs
# write.csv(jobs_today, "filtered_jobs.csv")

jobs_yesterday = read_excel(joe_filename_y) %>% 
mutate(deadline = as.Date(Application_deadline)) %>%
#filter(jp_section %in% c(<string>)),
	#!str_detect(str_to_lower(jp_title), "<string>"),
	deadline >= one_week_y) %>% # this excludes jobs with deadlines in under a week from 'yesterday'
arrange(deadline)

new_jobs = anti_join(jobs_today, jobs_yesterday)
write.csv(new_jobs, "new_jobs.csv")