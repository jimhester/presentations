# representative note.R file, once the code is moved into an R package
# gains roxygen comments and the importing/exporting re: the audio pkg

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
  x / 10
}

calc_length <- function(rate, length, bpm) {
  seq(1, as.integer(rate * length * 60 / bpm))
}

calc_multiplier <- function(rate) {
  2 * pi / rate
}

#' Plays musical notes
#'
#' @param note letter of a musical note (Bb)
#' @param length note length (1/2)
#' @param octave above and below middle C (-1)
#' @param volume volume between 1 - 10
#'
#' @return note object
#' @export
#'
#' @examples
#' note("Bb", 1/2, -1, 3)
note <- function(note, length = 1, octave = 0, volume = default_volume) {
  frequency <- calc_frequency(note, octave)
  volume <- calc_volume(volume)
  length <- calc_length(rate, length, bpm)
  multiplier <- calc_multiplier(rate)
  res <- sin(frequency * multiplier * length) * volume
  structure(res, class = "note")
}

#' @importFrom audio play play.default
#' @export
audio::play

#' @export
play.note <- audio::play.default

#' @export
print.note <- function(x, ...) {
  audio::play(x, ...)
}
