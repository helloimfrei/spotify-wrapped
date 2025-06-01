library(ggplot2)
library(dplyr)
library(readr)

top_artists_per_year <- tibble(read_csv("data/processed/top_artists_per_year.csv"))

fig <- ggplot(top_artists_per_year, 
       aes(x = year, y = rank, group = artist_name, color = artist_name)) +
  geom_line(linewidth = 8) +
  geom_point(size = 15) +
  geom_text(aes(label = label), vjust = -0.5, size = 12, color = "black") +
  scale_y_reverse() +
  scale_x_continuous(breaks = sort(unique(top_artists_per_year$year))) +
  labs(
    title = "Top Artists by Year",
    x = "Year",
    y = "Rank"
  ) +
  theme_minimal(base_size = 20) +
  theme(
    legend.position = "none"
  )

print(fig)
