# Pull job listings from the AEA Job Openings for Economists (JOE) job board

This repo pulls job listings from the [AEA JOE site](https://www.aeaweb.org/joe/listings). For PhD economists, this is our job market. Before running the R script in this repo, note:

1. You must first confirm the download link. To get the link, click the "Native XLS" download option, and note the resulting url:
![note the url](https://github.com/michael-black/aea-joe-job-pulling/blob/main/download_screenshot.png)

2. Run the script for the first time by uncommenting line 24:
```R
 write.csv(jobs_today, "filtered_jobs.csv")
```
And commenting out lines 26 - 34:
```R
# jobs_yesterday = read_excel(joe_filename_y) %>% 
# mutate(deadline = as.Date(Application_deadline)) %>%
# #filter(jp_section %in% c(<string>)),
# 	#!str_detect(str_to_lower(jp_title), "<string>"),
# 	deadline >= one_week_y) %>% # this excludes jobs with deadlines in under a week from 'yesterday'
# arrange(deadline)

# new_jobs = anti_join(jobs_today, jobs_yesterday)
# write.csv(new_jobs, "new_jobs.csv")
```

This will place an initial list of jobs in your directory.

3. Starting the day after you initially run the script, comment out line 24 again, and uncomment lines 26 - 34.

After following steps 1 - 3, run the script as often as you like (ideally at least once daily), and a list of new jobs posted since you last checked ("new_jobs.csv") will appear in your directory. 

If you have any issues or suggestions for improvement, please [let me know](mailto:mblack438@gmail.com)!