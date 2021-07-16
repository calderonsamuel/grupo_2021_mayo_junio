default_tbl <- function(x, ...) {
    necesita_scroll <- nrow(x) > 15
    x <- x %>% 
        kableExtra::kbl(caption = "", valign = "c") %>% 
        kableExtra::kable_styling(full_width = TRUE, 
                                  bootstrap_options = c("striped", "hover", "condensed", "responsive"))
    
    if (necesita_scroll) {
        x <- kableExtra::scroll_box(x, width = "100%", height = "600px", fixed_thead = TRUE)
    }
    x
}

knit_print.data.frame = function(x, ...) {
    res = paste(c("", "", default_tbl(x)), collapse = "\n")
    knitr::asis_output(res)
}

registerS3method(
    "knit_print", "data.frame", knit_print.data.frame,
    envir = asNamespace("knitr")
)