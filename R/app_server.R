#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny aws.s3 arrow
#' @noRd
app_server <- function(input, output, session) {
  options(warn = -1)

  source("set_cfg.R")

  disconnected <- tagList(
    h1("Oups, quelque chose s'est mal passé !"),
    p("Il semble que vous ayez été déconnecté. Veuillez rafraîchir la page ou revenir plus tard."),
    reload_button("Rafraîchir", class = "warning")
  )
    sever(html = disconnected, bg_color = "#000")


  data <- reactiveVal()
  data_filtered <- reactiveVal()
  data_disciplines <- reactiveVal()
  filters_applied <- reactiveVal(FALSE)

  nb_disciplines <- reactiveVal()
  nb_chems <- reactiveVal()
  nb_sujets.fr <- reactiveVal()
  nb_vegs <- reactiveVal()
  nb_techs <- reactiveVal()
  nb_pathogenes <- reactiveVal()
  nb_sujets_rameau <- reactiveVal()

  nb_disciplines(as.data.table(read.fst("data/nb_disciplines.fst")))
  nb_chems(as.data.table(read.fst("data/nb_chems.fst")))
  nb_sujets.fr(as.data.table(read.fst("data/nb_sujets.fr.fst")))
  nb_vegs(as.data.table(read.fst("data/nb_vegs.fst")))
  nb_techs(as.data.table(read.fst("data/nb_techs.fst")))
  nb_pathogenes(as.data.table(read.fst("data/nb_pathogenes.fst")))
  nb_sujets_rameau(as.data.table(read.fst("data/nb_sujets_rameau.fst")))

  noms_cn <- chinese_names()
  list_chems <- list_chems()
  list_tech <- list_tech()
  list_vegs <- list_vegs()
  list_pathogenes <- list_pathogenes()


  data(as.data.table(read.fst(path = "data/theses-soutenues-compact-light.fst")))

  suggestions <- s3read_using(
    read_parquet,
    object = "suggestions.parquet",
    bucket = "awsbucketpf/thesesfr"
  )


  output$thesesfrmeth <- renderText({
    includeMarkdown("inst/app/www/thesesfrmeth.md")
  })
  output$apropos <- renderText({
    includeMarkdown("inst/app/www/apropos.md")
  })

  observeEvent(input$suggestions,{
    showModal(modalDialog(
      title = "Soumettre une suggestion",
      textAreaInput(inputId = "suggestion_text",label = "Suggestion :",placeholder = "Merci de décrire votre suggestion"),
      h5("Merci de ne pas renseigner d'informations personnelles dans ce champ. Les informations soumises sont enregistrées."),
      footer = tagList(
        modalButton("Annuler"),
        actionButton("ok", "Envoyer")),
      easyClose = TRUE)
    )
  })
  observeEvent(input$ok,{
    removeModal()
    show_alert(title = "Merci pour votre suggestion !",type = "success")
    suggestions <- as.data.table(rbind(suggestions,cbind(as.character(Sys.Date()),input$suggestion_text)))
    s3write_using(
      x = suggestions,
      FUN = write_parquet,
      object = "suggestions.parquet",
      bucket = "awsbucketpf/thesesfr"
    )
    })

  observe({
    if(is.null(data())){return(NULL)
    } else{
      if(!filters_applied()){
        data_disciplines(data()[,.N,discipline][order(N,decreasing = TRUE)])
      } else{
        data_disciplines(data_filtered()[,.N,discipline][order(N,decreasing = TRUE)])
      }
    }
  })


  # Dynamic sidebar filters ----------------
  output$sidebar_exploration <- sidebar_exploration()

  ## Maj PickerInput ----------------
  observe({
    if(is.null(data_disciplines())){return(NULL)
    } else{
      if(!filters_applied()){
        updatePickerInput(session = session,inputId = "exploration_filter_discipline",choices = nb_disciplines()[1:min(nrow(nb_disciplines()),500),discipline])
        updatePickerInput(session = session,inputId = "exploration_filter_techs",choices = nb_techs()[1:min(nrow(nb_techs()),500),techs])
        updatePickerInput(session = session,inputId = "exploration_filter_sujets",choices = nb_sujets.fr()[1:min(nrow(nb_sujets.fr()),500),sujets.fr])
        updatePickerInput(session = session,inputId = "exploration_filter_chems",choices = nb_chems()[1:min(nrow(nb_chems()),500),chems])
        updatePickerInput(session = session,inputId = "exploration_filter_pathogenes",choices = nb_pathogenes()[1:min(nrow(nb_pathogenes()),500),pathogenes])
        updatePickerInput(session = session,inputId = "exploration_filter_vegs",choices = nb_vegs()[1:min(nrow(nb_vegs()),500),vegs])
        updatePickerInput(session = session,inputId = "exploration_filter_membres_sujets_rameau",choices = nb_sujets_rameau()[1:min(nrow(nb_sujets_rameau()),500),sujets_rameau])
      }
    }
  })


  ## Apply filters ----------------

  observeEvent(input$exploration_filters_apply,{
    # Récupérer les données
    tmp <- data()

    # Réinitialiser l'état du filtre
    filters_applied(FALSE)

    # Appliquer les filtres si les inputs ne sont pas NULL ou vides
    if (!is.null(input$exploration_filter_discipline) && length(input$exploration_filter_discipline) > 0) {
      tmp <- tmp[discipline %in% input$exploration_filter_discipline]
      filters_applied(TRUE)
    }
    if (!is.null(input$exploration_filter_techs) && length(input$exploration_filter_techs) > 0) {
      tmp <- tmp[techs %in% input$exploration_filter_techs]
      filters_applied(TRUE)
    }
    if (!is.null(input$exploration_filter_sujets) && length(input$exploration_filter_sujets) > 0) {
      tmp <- tmp[sujets.fr %in% input$exploration_filter_sujets]
      filters_applied(TRUE)
    }
    if (!is.null(input$exploration_filter_chems) && length(input$exploration_filter_chems) > 0) {
      tmp <- tmp[chems %in% input$exploration_filter_chems]
      filters_applied(TRUE)
    }
    if (!is.null(input$exploration_filter_pathogenes) && length(input$exploration_filter_pathogenes) > 0) {
      tmp <- tmp[pathogenes %in% input$exploration_filter_pathogenes]
      filters_applied(TRUE)
    }
    if (!is.null(input$exploration_filter_vegs) && length(input$exploration_filter_vegs) > 0) {
      tmp <- tmp[vegs %in% input$exploration_filter_vegs]
      filters_applied(TRUE)
    }
    if (!is.null(input$exploration_filter_membres_sujets_rameau) && length(input$exploration_filter_membres_sujets_rameau) > 0) {
      tmp <- tmp[sujets_rameau %in% input$exploration_filter_membres_sujets_rameau]
      filters_applied(TRUE)
    }
    if (input$exploration_filter_chinese) {
      tmp <- tmp[tolower(auteur.nom) %in% noms_cn[[1]][,nom] | tolower(auteur.prenom) %in% noms_cn[[2]][,prenom]]
      filters_applied(TRUE)
    }

    if (filters_applied()) {
      data_filtered(tmp)
    }
  })

  ## Reset filters ----------------
  observeEvent(input$exploration_filters_reset,{
    filters_applied(FALSE)
  })

  # Highcharts graphs tab1 ----------------
  observe({
    output$highchart_stats_disciplines <- renderHighchart(graph_explore(data = data_disciplines(),
                                                                       input_type = input$highchart_stats_type,
                                                                       input_pct = input$highchart_stats_pct))
  })

  observe({
    if(!filters_applied()){
      output$exploration_donnees_brutes <- create_dt(data()[,.(auteur.nom,
                                                               auteur.prenom,
                                                               date_soutenance,
                                                               discipline,
                                                               titres.fr,
                                                               nnt)],length =  10,
                                                     cols_names = c("Nom","Prénom","Date","Discipline","Sujet","Id"))
      output$download_data <- dl_button_serv(data()[,.(auteur.nom,
                                                             auteur.prenom,
                                                             date_soutenance,
                                                             discipline,
                                                             titres.fr,
                                                             nnt)],
                                             label = "data_theses")
    } else{
      output$exploration_donnees_brutes <- create_dt(data_filtered()[,.(auteur.nom,
                                                               auteur.prenom,
                                                               date_soutenance,
                                                               discipline,
                                                               titres.fr,
                                                               nnt)],length =  10,
                                                     cols_names = c("Nom","Prénom","Date","Discipline","Sujet","Id"))
      output$download_data <- dl_button_serv(data_filtered()[,.(auteur.nom,
                                                       auteur.prenom,
                                                       date_soutenance,
                                                       discipline,
                                                       titres.fr,
                                                       nnt)],
                                             label = "data_theses")
    }
  })






    # TODO : split observe to optimize select_seasonal
    observe({
      if(is.null(data())){return(NULL)
      } else{
        if(!filters_applied()){
          data_temp <- data()[!is.na(date_soutenance),.(date_soutenance)]}
        else{data_temp <- data_filtered()[!is.na(date_soutenance),.(date_soutenance)]}
        data_temp <- data_temp[,date := as.Date(date_soutenance,"%Y-%m-%d")]

        data_temp[,valeur := .N,date]

        data_temp <- data_temp[,.(date,valeur)]
        data_temp <- data_temp[!duplicated(date)]
        data_temp <- data_temp[!is.na(date)]
        data_temp_xts <- xts(data_temp[,-1,with = FALSE],order.by = data_temp$date)
        if(nrow(data_temp) > 365){
        data_temp_xts$ma90 <- rollapply(data_temp_xts, width = 90, FUN = mean, align = "right", fill = NA)
        data_temp_xts$ma365 <- rollapply(data_temp_xts$valeur, width = 365, FUN = mean, align = "right", fill = NA)
        output$exploration_timegraph <- renderHighchart(
          highchart(type = "stock") |>
            hc_add_series(data_temp_xts$valeur, yAxis = 0, name = "Soutenances") |>
            hc_add_series(data_temp_xts$ma90,type = "line", yAxis = 0, name = "MM90") |>
            hc_add_series(data_temp_xts$ma365,type = "line", yAxis = 0, name = "MM365"))
        } else{
          output$exploration_timegraph <- renderHighchart(
            highchart(type = "stock") |>
              hc_add_series(data_temp_xts$valeur, yAxis = 0, name = "Soutenances"))
        }
      }

      req(input$select_seasonal)
      if(is.null(input$select_seasonal)){return(NULL)
      } else{
        if(input$select_seasonal %in% "Hebdomadaire"){type_graph <- "wday.lbl"}
        if(input$select_seasonal %in% "Mensuel"){type_graph <- "month.lbl"}
        if(input$select_seasonal %in% "Trimestriel"){type_graph <- "quarter"}
        if(input$select_seasonal %in% "Annuel"){type_graph <- "year"}

        output$exploration_timegraph_seasonal <- renderPlotly(
          data_temp %>%
            plot_seasonal_diagnostics(date, valeur, .interactive = TRUE,.feature_set = type_graph)
        )
      }
    })

    output$exploration_donnees_ncn <- create_dt(noms_cn[[1]],length = 10)
    output$download_ncn <- dl_button_serv(noms_cn[[1]],"nom_cn")
    output$exploration_donnees_pcn <- create_dt(noms_cn[[2]],length = 10)
    output$download_pcn <- dl_button_serv(noms_cn[[2]],"prenoms_cn")
    output$exploration_donnees_techs <- create_dt(list_tech,length = 20)
    output$download_techs <- dl_button_serv(list_tech,"techs")
    output$exploration_donnees_pathogenes <- create_dt(list_pathogenes,length = 20)
    output$download_pathogenes <- dl_button_serv(list_pathogenes,"pathogenes")
    output$exploration_donnees_chems <- create_dt(list_chems,length = 20)
    output$download_chems <- dl_button_serv(list_chems,"chems")
    output$exploration_donnees_vegs <- create_dt(list_vegs,length = 20)
    output$download_vegs <- dl_button_serv(list_vegs,"vegs")

    observe({
      if(!filters_applied()){
      output$exploration_donnees_theses <- create_dt(data(),length = 20)
      } else{
        output$exploration_donnees_theses <- create_dt(data_filtered(),length = 20)
      }
    })


    observe({
      req(input$highchart_stats_type)
      if(input$highchart_stats_type %in% "pie"){
        updateRadioGroupButtons(session = session,inputId = "highchart_stats_pct", selected = "niv",disabled = TRUE)
      } else{
        updateRadioGroupButtons(session = session,inputId = "highchart_stats_pct",disabled = FALSE)
      }
    })


}

