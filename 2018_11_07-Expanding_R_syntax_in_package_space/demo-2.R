# Altparsers --------------------------------------------------------------

library(altparsers)
# normal R REPL
repl(parse_text)

x <- 5
x
x + 3
x -
3
q()

# S-expression REPL
repl(sexp_parse_text)
(* 5 (+ 3 4))

(q)

# py parser
py_parse_file("test.Rp")
eval(py_parse_file("test.Rp"))
factorial(5)

repl(py_parse_text)
logit = function(p)
  log(1 / (1 - p))

logit(.5)

q()

# tidy parser REPL
repl(tidy_parse_text)

x <- [1, 2, 3, [4, 5, 6]]
str(x)
x |> head(n = 3) |> tail(n = 1)

quote(x |> head(n = 3) |> tail(n = 1))

g"{letters} - {letters}" |>
  sub(r"(\w)", r"\U\1", _, perl = TRUE) |>
  head()

quote(g"{letters} - {letters}" |>
  sub(r"(\w)", r"\U\1", _, perl = TRUE) |>
  head()
)

q()
