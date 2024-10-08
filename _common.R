# upgrade pak
# pak::pak('mjfrigaard/shinypak', ask = FALSE, upgrade = TRUE)

options(width = 50L, pillar.width = 50L)

if (dir.exists('data/README_files')) {
  unlink("data/README_files", recursive = TRUE, force = TRUE)
} 

if (file.exists('data/README.html')) {
  unlink("data/README.html", force = TRUE)
} 

unlink("data/README.html")

readme_stuff <- list.files(
    path = "data",
    pattern = "html|files",
    full.names = TRUE,
    include.dirs = TRUE,
    all.files = TRUE)

sapply(X = readme_stuff, FUN = unlink, force = TRUE, recursive = TRUE)

co_box <- function(
  color = "b",
  margin = FALSE,
  header = "header",
  contents = "Your text",
  size = "1.05",
  hsize = "1.10",
  fold = FALSE,
  look = "default", 
  icon = FALSE) {
  
  if (look == "simple") {
    look <- "simple"
  } else if (look == "minimal") {
    look <- "minimal"
  } else {
    look <- "default"
  }
  fold <- tolower(as.character(fold))
  ico <- tolower(as.character(icon))
  size <- as.character(size)
  
  class <- switch(color,
    b = "note",
    g = "tip",
    r = "important",
    o = "warning",
    y = "caution",
    stop("Invalid `type`", call. = FALSE)
  )
  if (isFALSE(margin)) {
    switch(color,
        b = cat(paste0(
          "\n\n",
          ":::: {.callout-", class, " collapse='", fold, "'", " appearance='", look, "' icon='", ico, "'}", "\n\n",
          "## [", header, "]{style='font-weight: bold; font-size: ", hsize, "em;'}\n\n",
          "::: {style='font-size: ", size, "em; color: #282b2d;'}\n\n",
          "\n", glue::glue_collapse(contents), "\n\n",
          "::: \n\n",
          "::::", "\n"
        )),
        g = cat(paste0(
          "\n\n",
          ":::: {.callout-", class, " collapse='", fold, "'", " appearance='", look, "' icon='", ico, "'}", "\n\n",
          "## [", header, "]{style='font-weight: bold; font-size: ", hsize, "em;'}\n\n",
          "::: {style='font-size: ", size, "em; color: #282b2d;'}\n\n",
          "\n", glue::glue_collapse(contents), "\n\n",
          "::: \n\n",
          "::::", "\n"
        )),
        y = cat(paste0(
          "\n\n",
          ":::: {.callout-", class, " collapse='", fold, "'", " appearance='", look, "' icon='", ico, "'}", "\n\n",
          "## [", header, "]{style='font-weight: bold; font-size: ", hsize, "em;'}\n\n",
          "::: {style='font-size: ", size, "em; color: #282b2d;'}\n\n",
          "\n", glue::glue_collapse(contents), "\n\n",
          "::: \n\n",
          "::::", "\n"
        )),
        o = cat(paste0(
          "\n\n",
          ":::: {.callout-", class, " collapse='", fold, "'", " appearance='", look, "' icon='", ico, "'}", "\n\n",
          "## [", header, "]{style='font-weight: bold; font-size: ", hsize, "em;'}\n\n",
          "::: {style='font-size: ", size, "em; color: #282b2d;'}\n\n",
          "\n", glue::glue_collapse(contents), "\n\n",
          "::: \n\n",
          "::::", "\n"
        )),
        r = cat(paste0(
          "\n\n",
          ":::: {.callout-", class, " collapse='", fold, "'", " appearance='", look, "' icon='", ico, "'}", "\n\n",
          "## [", header, "]{style='font-weight: bold; font-size: ", hsize, "em;'}\n\n",
          "::: {style='font-size: ", size, "em; color: #282b2d;'}\n\n",
          "\n", glue::glue_collapse(contents), "\n\n",
          "::: \n\n",
          "::::", "\n"
        )),
        stop("Invalid `type`", call. = FALSE)
      )
  } else {
switch(color,
    b = cat(paste0(
      "\n\n",
      "::::: {.column-margin}",
      "\n\n",
      ":::: {.callout-", class, " collapse='", fold, "'", " appearance='", look, "' icon='", ico, "'}", "\n\n",
      "## [", header, "]{style='font-weight: bold; font-size: ", hsize, "em;'}\n\n",
      "::: {style='font-size: ", size, "em; color: #282b2d;'}\n\n",
      "\n", glue::glue_collapse(contents), "\n\n",
      "::: \n\n",
      "::::", 
      "\n\n",
      ":::::"
    )),
    g = cat(paste0(
      "\n\n",
      "::::: {.column-margin}",
      "\n\n",
      ":::: {.callout-", class, " collapse='", fold, "'", " appearance='", look, "' icon='", ico, "'}", "\n\n",
      "## [", header, "]{style='font-weight: bold; font-size: ", hsize, "em;'}\n\n",
      "::: {style='font-size: ", size, "em; color: #282b2d;'}\n\n",
      "\n", glue::glue_collapse(contents), "\n\n",
      "::: \n\n",
      "::::", 
      "\n\n",
      ":::::" 
    )),
    y = cat(paste0(
      "\n\n",
      "::::: {.column-margin}",
      "\n\n",
      ":::: {.callout-", class, " collapse='", fold, "'", " appearance='", look, "' icon='", ico, "'}", "\n\n",
      "## [", header, "]{style='font-weight: bold; font-size: ", hsize, "em;'}\n\n",
      "::: {style='font-size: ", size, "em; color: #282b2d;'}\n\n",
      "\n", glue::glue_collapse(contents), "\n\n",
      "::: \n\n",
      "::::", 
      "\n\n",
      ":::::" 
    )),
    o = cat(paste0(
      "\n\n",
      "::::: {.column-margin}",
      "\n\n",
      ":::: {.callout-", class, " collapse='", fold, "'", " appearance='", look, "' icon='", ico, "'}", "\n\n",
      "## [", header, "]{style='font-weight: bold; font-size: ", hsize, "em;'}\n\n",
      "::: {style='font-size: ", size, "em; color: #282b2d;'}\n\n",
      "\n", glue::glue_collapse(contents), "\n\n",
      "::: \n\n",
      "::::", 
      "\n\n",
      ":::::"
    )),
    r = cat(paste0(
      "\n\n",
      "::::: {.column-margin}",
      "\n\n",
      ":::: {.callout-", class, " collapse='", fold, "'", " appearance='", look, "' icon='", ico, "'}", "\n\n",
      "## [", header, "]{style='font-weight: bold; font-size: ", hsize, "em;'}\n\n",
      "::: {style='font-size: ", size, "em; color: #282b2d;'}\n\n",
      "\n", glue::glue_collapse(contents), "\n\n",
      "::: \n\n",
      "::::", 
      "\n\n",
      ":::::"
    )),
    stop("Invalid `type`", call. = FALSE)
    )
  }
}

git_contrib_box <- function(
                repo = 'fm-unix', 
                header = "See a typo, error, or something missing?",
                contents = "Please open an issue on ",
                hsize = "1.15", 
                size = "1.00", 
                fold = FALSE) {
  
  git_repo_root <- "https://github.com/mjfrigaard/"
  new_issue <- "/issues/new"
  
  fold <- tolower(fold)
  
  gh_repo_link <- paste0("[GitHub.]", "(", git_repo_root, repo, new_issue, ")")
  gh_repo_link
  
  cat(paste0(
        "\n\n",
        ":::: {.callout-note", " collapse='", fold, "'", " appearance='simple' icon=false}", "\n\n",
        "## [", header, "]{style='font-weight: bold; font-size: ", hsize, "em;'}\n\n",
        "::: {style='font-size: ", size, "em; color: #282b2d;'}\n\n",
        "\n", 
        glue::glue_collapse(contents), 
        gh_repo_link,
        "\n\n",
        "::: \n\n",
        "::::", "\n"
      ))
  
  
}

margin_box <- function(shell = "bash", sys = 'macos', sh_w = '30', sys_w = '30') {
  sh_img <- switch(
    shell,
    bash = paste0(
      "Bash ![](img/bash-logo.svg){fig-align='center' width='",
      sh_w,
      "'}"
    ),
    zsh = paste0(
      "Zsh ![](img/zshell-logo.png){fig-align='center' width='",
      sh_w,
      "'}"
    ))
  
  sys_img <- switch(sys,
    linux = paste0("Linux ![](img/tut.png){fig-align='center' width='", sys_w, "'}"),
    macos = paste0("macOS ![](img/macos.png){fig-align='center' width='", sys_w, "'}")
  )

  switch(sys,
  macos = cat(paste0(
      "\n",
      "::::{.column-margin}\n\n",
      ":::{style='font-size: 0.90rem;'}\n\n",
      sh_img, " on ", sys_img, ".\n\n",
      ":::\n",
      ":::: \n\n"
    )),
  linux = cat(paste0(
      "\n",
      "::::{.column-margin}\n\n",
      ":::{style='font-size: 0.90rem;'}\n\n",
      sh_img, " on ", sys_img, ".\n\n",
      ":::\n",
      ":::: \n\n"
    )),
    stop("Invalid `type`", call. = FALSE)
  )
}
