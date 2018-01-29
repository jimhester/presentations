# https://stackoverflow.com/questions/4974531/writing-musical-notes-to-a-wav-file
rate <- 44100
multiplier <- 2 * pi / rate
bpm <- 80
default_volume <- 5

notes <- c("A" = 0, "A#" = 1, "Bb" = 1, "B" = 2, "Cb" = 2, "B#" = 3, "C" = 3,
  "C#" = 4, "Db" = 4, "D" = 5, "D#" = 6, "Eb" = 6, "E" = 7, "Fb" = 7, "E#" = 8,
  "F" = 8, "F#" = 9, "Gb" = 9, "G" = 10, "G#" = 11, "Ab" = 11)

calc_frequency <- function(note, octave) {
  # 440hz is A above middle C
  440 * 2^((unname(notes[note]) + (octave * 12)) / 12)
}

calc_volume <- function(x) {
  # x should be between 1 and 10
  stopifnot(x >= 1, x <= 10)
  
  x / 10
}

calc_length <- function(rate, length, bpm) {
  seq(1, as.integer(rate * length * 60 / bpm))
}

calc_multiplier <- function(rate) {
  2 * pi / rate
}

note <- function(note, length = 1, octave = 0, volume = default_volume) {
  frequency <- calc_frequency(note, octave)
  volume <- calc_volume(volume)
  length <- calc_length(rate, length, bpm)
  multiplier <- calc_multiplier(rate)
  res <- sin(frequency * multiplier * length) * volume
  structure(res, class = "note")
}

# install.packages(audio)
library(audio)

play <- audio::play

print.note <- function(x, ...) {
  audio::play(x, ...)
}

# script ------------------------------------------------------------------

note("C")

play(c(
  note("G", 1/2, octave = -1),
  note("E", 1/2),
  note("C")))

usethis::create_package("~/note")

usethis::use_package("audio")

devtools::document()

devtools::load_all()

usethis::use_readme_md()

play(c(
  note("C", 3/4),
  note("C", 3/4),
  note("C", 1/2),
  note("D", 1/4),
  note("E", 3/4),

  note("E", 1/2),
  note("D", 1/4),
  note("E", 1/2),
  note("F", 1/4),
  note("G", 3/4)))

usethis::use_mit_license("Jim Hester")

usethis::use_test()
usethis::use_r()

play(c(
  note("B", 1/2),
  note("E", 3/4),
  note("G", 1/4),
  note("F#", 1/2),
  note("E", 1/1),
  note("B", 1/2, 1),
  note("A", 3/2, 1),
  note("F#", 3/2),

  note("E", 3/4),
  note("G", 1/4),
  note("F#", 1/2),
  note("D#", 1/1),
  note("F", 1/2),
  note("B", 4/2)))

# time permitting ---------------------------------------------------------

usethis::use_git()

usethis::use_github()

usethis::use_travis()

usethis::use_coverage()

usethis::use_rcpp()
