library(altparsers)
# normal R REPL
repl(parse_text)

x <- 5
x
x + 3
x -
3
q()

# tidy parser REPL
repl(tidy_parse_text)

x <- [1, 2, 3, [4, 5, 6]]
x
x |> head(n = 3) |> tail(n = 1)

quote(x |> head(n = 3) |> tail(n = 1))

g"{letters} - {letters}" |>
  sub(r"(\w)", r"\U\1", _, perl = TRUE) |>
  head()

q()

# S-expression REPL
altparsers::repl(altparsers::sexp_parse_text)
(* 5 (+ 3 4))

(q)

# Load ex package
library(ex)

title_case
title_case(foo, bar)
title_case(pi, "=", pi2)
title_case(pi, "=", !!pi2)
title_case(!!pi, "!=", !!pi2)
