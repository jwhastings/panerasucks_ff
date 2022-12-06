rm(list = ls())
s  <- 2022 # current season
wk <- 13   # current week

# Render index
rmarkdown::render(
  "index.Rmd",
  params = list(current_week = wk, current_season = s),
  output_file = "index"
)

# Render league history
rm(list = setdiff(ls(), c("s", "wk")))

rmarkdown::render(
  "league_history.Rmd",
  params = list(current_week = wk, current_season = s),
  output_file = "league_history/index"
)

# Render current weekly report
# rm(list = setdiff(ls(), c("s", "wk")))
# 
# out_dir <- paste0("weekly_reports/", s, "/week", wk)
# if (!dir.exists(out_dir)) dir.create(out_dir)
# 
# rmarkdown::render(
#   "weekly_report.Rmd",
#   params = list(current_week = wk, current_season = s),
#   output_file = paste0(out_dir, "/index")
# )

# Render all reports to from week 1 to current week
for (i in 1:wk) {
  rm(list = setdiff(ls(), c("s", "wk", "i")))
  
  out_dir <- paste0("weekly_reports/", s, "/week", i)
  if (!dir.exists(out_dir)) dir.create(out_dir)

  rmarkdown::render(
    "weekly_report.Rmd",
    params = list(current_week = i, current_season = s),
    output_file = paste0(out_dir, "/index")
  )
}
