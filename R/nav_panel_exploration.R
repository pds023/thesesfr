

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
                                             card(full_screen = TRUE,fill = FALSE,
                                                  card_title(div(class = "card-title-container",
                                                                 div(class = "title-tooltip","Disciplines"),
                                                                 div(class = "radio-group-buttons",
                                                                     create_radio("highchart_stats_pct","pct")))),
                                                  # height = "575px",min_height = "575px",
                                                  card_body(
                                                    highchartOutput("highchart_stats_disciplines")
                                                  ),
                                                  card_footer(create_radio("highchart_stats_type","graph"))
                                             )),
                                      column(6,
                                             card(full_screen = TRUE,fill = FALSE,
                                                  # height = "575px", min_height = "575px",
                                                  card_title(div(class = "card-title-container",
                                                                 div(class = "title-tooltip","Analyse temporelle",
                                                                     tooltip(
                                                                       bs_icon("info-circle"),
                                                                       "MMn : moyenne mobile d'ordre n"
                                                                     )))),
                                                  card_body(
                                                    navset_card_underline(nav_panel(title = "Données brutes",
                                                                                    highchartOutput("exploration_timegraph")),
                                                                          nav_panel(title = "Saisonnalité",
                                                                                    pickerInput(inputId = "select_seasonal",
                                                                                                choices = c("Hebdomadaire","Mensuel",
                                                                                                            "Trimestriel","Annuel"),
                                                                                                selected = "Hebdomadaire"),
                                                                                    plotlyOutput("exploration_timegraph_seasonal")))
                                                  )
                                             ))
                                    ),
                                    card(full_screen = TRUE,fill = FALSE,
                                         # min_height = "300px",
                                         card_title(div(class = "card-title-container",
                                                        div(class = "title-tooltip","Données détaillées"))),
                                         card_body(
                                           DTOutput("exploration_donnees_brutes"),
                                         ),
                                         card_footer(downloadButton("download_data",label = "Télécharger"))
                                    )
                          ),
                          nav_panel(title = "Données utilisées",icon = bs_icon("database"),
                                    navset_card_underline(
                                      nav_panel(title = "CN",
                                                card(full_screen = TRUE,
                                                     card_title("Noms retenus"),
                                                     card_body(DTOutput("exploration_donnees_ncn")),
                                                     card_footer(downloadButton("download_ncn",label = "Télécharger"))),
                                                card(full_screen = TRUE,
                                                     card_title("Prénoms retenus"),
                                                     card_body(DTOutput("exploration_donnees_pcn")),
                                                     card_footer(downloadButton("download_pcn",label = "Télécharger")))),
                                      nav_panel(title = "Technologies",
                                                card(full_screen = TRUE,fill = FALSE,
                                                     card_title("Listes des technologies retenues"),
                                                     card_body(DTOutput("exploration_donnees_techs")),
                                                     card_footer(downloadButton("download_techs",label = "Télécharger")))),
                                      nav_panel(title = "Pathogènes",
                                                card(full_screen = TRUE,fill = FALSE,
                                                  card_title("Liste des pathogènes retenus"),
                                                  card_body(DTOutput("exploration_donnees_pathogenes")),
                                                  card_footer(downloadButton("download_pathogenes",label = "Télécharger")))),
                                      nav_panel(title = "Précurseurs",
                                                card(full_screen = TRUE,fill = FALSE,
                                                  card_title("Liste des précurseurs retenus"),
                                                  card_body(DTOutput("exploration_donnees_chems")),
                                                  card_footer(downloadButton("download_chems",label = "Télécharger")))),
                                      nav_panel(title = "Végétaux",
                                                card(full_screen = TRUE,fill = FALSE,
                                                     card_title("Liste des végétaux retenus"),
                                                     card_body(DTOutput("exploration_donnees_vegs")),
                                                     card_footer(downloadButton("download_vegs",label = "Télécharger")))),
                                      nav_panel(title = "Thèses",
                                                card(full_screen = TRUE,fill = FALSE,
                                                     card_title("Données brutes utilisées"),
                                                     card_body(DTOutput("exploration_donnees_theses")),
                                                     card_footer(downloadButton("download_theses",label = "Télécharger"))))
                                    )
                          )
              )
    )
  )
}
