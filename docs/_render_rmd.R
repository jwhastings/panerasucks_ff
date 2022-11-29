rm(list = ls())
s  <- 2022 # current season
wk <- 12   # current week

# Render index
rmarkdown::render(
  "index.Rmd",
  params = list(current_week = wk, current_season = s),
  output_file = "index"
)

# Render current weekly report
rm(list = setdiff(ls(), c("s", "wk")))
rmarkdown::render(
  "weekly_report.Rmd",
  params = list(current_week = wk, current_season = s),
  output_file = paste0("weekly_reports/", s, "/week", wk)
)

# Render league history
rm(list = setdiff(ls(), c("s", "wk")))

rmarkdown::render(
  "league_history.Rmd",
  params = list(current_week = wk, current_season = s),
  output_file = "league_history/league_history"
)

# Render all reports to from week 1 to current week
# for (i in 1:wk) {
#   rm(list = setdiff(ls(), c("s", "wk", "i")))
# 
#   rmarkdown::render(
#     "weekly_report.Rmd",
#     params = list(current_week = i, current_season = s),
#     output_file = paste0("weekly_reports/", s, "/week", i)
#   )
# }
