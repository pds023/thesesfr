

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
                                             card(card_header("Disciplines"),height = "575px",min_height = "575px",
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
                                                              )),height = "575px",min_height = "575px",
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
                                    card(card_header("Données détaillées"),min_height = "300px",
                                         card_body(
                                           DTOutput("exploration_donnees_brutes"),
                                         ),
                                         card_footer(downloadButton("download_data",label = "Télécharger"))
                                    )
                          ),
                          nav_panel(title = "Données utilisées",icon = bs_icon("database"),
                                    navset_card_underline(
                                      nav_panel(title = "CN",
                                                card(card_header("Noms"),
                                                     DTOutput("exploration_donnees_ncn"),
                                                     card_footer(downloadButton("download_ncn",label = "Télécharger"))),
                                                card(card_header("Prénoms"),
                                                     DTOutput("exploration_donnees_pcn"),
                                                     card_footer(downloadButton("download_pcn",label = "Télécharger")))),
                                      nav_panel(title = "Technologies",
                                                DTOutput("exploration_donnees_techs"),
                                                card_footer(downloadButton("download_techs",label = "Télécharger"))),
                                      nav_panel(title = "Pathogènes",
                                                DTOutput("exploration_donnees_pathogenes"),
                                                card_footer(downloadButton("download_pathogenes",label = "Télécharger"))),
                                      nav_panel(title = "Précurseurs",
                                                DTOutput("exploration_donnees_chems"),
                                                card_footer(downloadButton("download_chems",label = "Télécharger"))),
                                      nav_panel(title = "Végétaux",
                                                DTOutput("exploration_donnees_vegs"),
                                                card_footer(downloadButton("download_vegs",label = "Télécharger"))),
                                      nav_panel(title = "Thèses",
                                                DTOutput("exploration_donnees_theses"),
                                                card_footer(downloadButton("download_theses",label = "Télécharger")))
                                    )
                          )
              )
    )
  )
}
