

#' Title
#'
#' @return
#' @export
#'
#' @examples
nav_panel_exploration <- function() {
  return(
    nav_panel("Exploration",icon = bs_icon("search"),
              page_navbar(id = "dataPanel_exploration",
                          sidebar = uiOutput("sidebar_exploration"),
                          nav_panel("Vue d'ensemble", icon = bs_icon("clipboard2-data"),
                                    value = "panel_exploration_vuedensemble",
                                    fluidRow(
                                      column(6,
                                             card(card_header("Disciplines"),
                                                  card_body(
                                                    withSpinner(highchartOutput("highchart_stats_disciplines")),
                                                    fluidRow(
                                                      column(4,create_radio("highchart_stats_disciplines_type","type")),
                                                      column(4,create_radio("highchart_stats_disciplines_pct","pct"))))
                                             )),
                                      column(6,
                                             card(card_header("Analyse temporelle",
                                                              tooltip(
                                                                bs_icon("info-circle"),
                                                                "MMn : moyenne mobile d'ordre n"
                                                              )),
                                                  card_body(
                                                    navset_card_underline(nav_panel(title = "Données brutes",
                                                                                    withSpinner(highchartOutput("exploration_timegraph"))),
                                                                          nav_panel(title = "Saisonnalité",
                                                                                    pickerInput(inputId = "select_seasonal",
                                                                                                choices = c("Hebdomadaire","Mensuel",
                                                                                                            "Trimestriel","Annuel"),
                                                                                                selected = "Hebdomadaire"),
                                                                                    withSpinner(plotlyOutput("exploration_timegraph_seasonal"))))
                                                  )
                                             ))
                                    )
                                    ,
                                    card(card_header("Données détaillées"),
                                         card_body(
                                           DTOutput("exploration_donnees_brutes")
                                         )
                                    )
                          ),
                          nav_panel(title = "Données utilisées",icon = bs_icon("database"),
                                    navset_card_underline(
                                      nav_panel(title = "CN",
                                                card(card_header("Noms"),
                                                     DTOutput("exploration_donnees_ncn")),
                                                card(card_header("Prénoms"),
                                                     DTOutput("exploration_donnees_pcn"))),
                                      nav_panel(title = "Technologies",
                                                DTOutput("exploration_donnees_techs")),
                                      nav_panel(title = "Pathogènes",
                                                DTOutput("exploration_donnees_pathogenes")),
                                      nav_panel(title = "Précurseurs",
                                                DTOutput("exploration_donnees_chems")),
                                      nav_panel(title = "Végétaux",
                                                DTOutput("exploration_donnees_vegs")),
                                    )


                          )
              )
    )
  )
}
