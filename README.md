# reference-helper-scripts

A tiny, opinionated would-like-to-be collection of helper scripts to deal with references in scientific manuscripts (mainly in the social sciences).

## Requirements

- R with support for RMarkdown
- [readtext](https://rdocumentation.org/packages/readtext/versions/0.80) package
  - Note that `readtext` requires `pdftools` which in turn requires `poppler` to work. Trying to `install.packages('pdftools')` will give you the necessary hints on how to get it if it is not already present on your system.
- [stringr](https://cran.r-project.org/web/packages/stringr/index.html) package
- pandoc (optional)

# LICENSE

MIT.