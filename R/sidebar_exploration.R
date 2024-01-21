#' Title
#'
#' @return
#' @export
#'
#' @examples
sidebar_exploration <- function() {
  renderUI({
    accordion(accordion_panel(title = "Filtrer",icon = icon("filter"),
                              checkboxInput(inputId = "exploration_filter_chinese",
                                            label = "Chine"),
                              pickerInput(inputId = "exploration_filter_discipline",multiple = TRUE,
                                          options = list(
                                            `live-search` = TRUE,
                                            `container` = 'body'),
                                          label = "Discipline",
                                          choices = c("")),
                              pickerInput(inputId = "exploration_filter_techs",multiple = TRUE,
                                          options = list(
                                            `live-search` = TRUE,
                                            `container` = 'body'), label = "Technologies",
                                          choices = c("")),
                              pickerInput(inputId = "exploration_filter_chems",multiple = TRUE,
                                          options = list(
                                            `live-search` = TRUE,
                                            `container` = 'body'), label = "Précurseurs chimiques",
                                          choices = c("")),
                              pickerInput(inputId = "exploration_filter_pathogenes",multiple = TRUE,
                                          options = list(
                                            `live-search` = TRUE,
                                            `container` = 'body'), label = "Pathogènes",
                                          choices = c("")),
                              pickerInput(inputId = "exploration_filter_vegs",multiple = TRUE,
                                          options = list(
                                            `live-search` = TRUE,
                                            `container` = 'body'), label = "Végétaux",
                                          choices = c("")),
                              pickerInput(inputId = "exploration_filter_sujets",multiple = TRUE,
                                          options = list(
                                            `live-search` = TRUE,
                                            `container` = 'body'), label = "Sujets",
                                          choices = c("")),
                              pickerInput(inputId = "exploration_filter_membres_sujets_rameau",multiple = TRUE,
                                          options = list(
                                            `live-search` = TRUE,
                                            `container` = 'body'), label = "Sujets rameau",
                                          choices = c("")),
                              actionButton(inputId = "exploration_filters_apply",label = "Appliquer"),
                              actionButton(inputId = "exploration_filters_reset",label = "Réinitialiser"))

    )
  })
}
