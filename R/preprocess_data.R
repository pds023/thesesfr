#' Title
#'
#' @param data
#'
#' @return
#' @export
#' @import data.table arrow fst stringr
#' @examples
preprocess_data <- function(data = "data/theses-soutenues.fst") {

  data <- read.fst("data/theses-soutenues.fst",as.data.table = TRUE)

  data[,directeurs_these.idref := paste(directeurs_these.0.idref,
                                        directeurs_these.1.idref,
                                        directeurs_these.2.idref,
                                        directeurs_these.3.idref,
                                        directeurs_these.4.idref,
                                        directeurs_these.5.idref,
                                        directeurs_these.6.idref,
                                        sep = ";")][,directeurs_these.idref := gsub(pattern = ";+$",
                                                                                   replacement = "",
                                                                                   directeurs_these.idref)]
  data[,`:=`(directeurs_these.0.idref = NULL,
             directeurs_these.1.idref = NULL,
             directeurs_these.2.idref = NULL,
             directeurs_these.3.idref = NULL,
             directeurs_these.4.idref = NULL,
             directeurs_these.5.idref = NULL,
             directeurs_these.6.idref = NULL)]

  data[,directeurs_these.nom := paste(directeurs_these.0.nom,
                                      directeurs_these.1.nom,
                                      directeurs_these.2.nom,
                                      directeurs_these.3.nom,
                                      directeurs_these.4.nom,
                                      directeurs_these.5.nom,
                                      directeurs_these.6.nom,
                                      sep = ";")][,directeurs_these.nom := gsub(pattern = ";+$",
                                                                               replacement = "",
                                                                               directeurs_these.nom)]
  data[,`:=`(directeurs_these.0.nom = NULL,
             directeurs_these.1.nom = NULL,
             directeurs_these.2.nom = NULL,
             directeurs_these.3.nom = NULL,
             directeurs_these.4.nom = NULL,
             directeurs_these.5.nom = NULL,
             directeurs_these.6.nom = NULL)]

  data[,directeurs_these.prenom := paste(directeurs_these.0.prenom,
                                         directeurs_these.1.prenom,
                                         directeurs_these.2.prenom,
                                         directeurs_these.3.prenom,
                                         directeurs_these.4.prenom,
                                         directeurs_these.5.prenom,
                                         directeurs_these.6.prenom,
                                         sep = ";")][,directeurs_these.prenom := gsub(pattern = ";+$",
                                                                                     replacement = "",
                                                                                     directeurs_these.prenom)]
  data[,`:=`(directeurs_these.0.prenom = NULL,
             directeurs_these.1.prenom = NULL,
             directeurs_these.2.prenom = NULL,
             directeurs_these.3.prenom = NULL,
             directeurs_these.4.prenom = NULL,
             directeurs_these.5.prenom = NULL,
             directeurs_these.6.prenom = NULL)]

  data[,ecoles_doctorales.idref := paste(ecoles_doctorales.0.idref,
                                         ecoles_doctorales.1.idref,
                                         sep = ";")][,ecoles_doctorales.idref := gsub(pattern = ";+$",
                                                                                     replacement = "",
                                                                                     ecoles_doctorales.idref)]
  data[,`:=`(ecoles_doctorales.0.idref = NULL,
             ecoles_doctorales.1.idref = NULL)]

  data[,ecoles_doctorales.nom := paste(ecoles_doctorales.0.nom,
                                       ecoles_doctorales.1.nom,
                                       sep = ";")][,ecoles_doctorales.nom := gsub(pattern = ";+$",
                                                                                 replacement = "",
                                                                                 ecoles_doctorales.nom)]
  data[,`:=`(ecoles_doctorales.0.nom = NULL,
             ecoles_doctorales.1.nom = NULL)]

  data[,etablissements_soutenance.idref := paste(etablissements_soutenance.0.idref,
                                                 etablissements_soutenance.1.idref,
                                                 etablissements_soutenance.2.idref,
                                                 etablissements_soutenance.3.idref,
                                                 etablissements_soutenance.4.idref,
                                                 sep = ";")][,etablissements_soutenance.idref := gsub(pattern = ";+$",
                                                                                                     replacement = "",
                                                                                                     etablissements_soutenance.idref)]
  data[,`:=`(etablissements_soutenance.0.idref = NULL,
             etablissements_soutenance.1.idref = NULL,
             etablissements_soutenance.2.idref = NULL,
             etablissements_soutenance.3.idref = NULL,
             etablissements_soutenance.4.idref = NULL)]

  data[,etablissements_soutenance.nom := paste(etablissements_soutenance.0.nom,
                                               etablissements_soutenance.1.nom,
                                               etablissements_soutenance.2.nom,
                                               etablissements_soutenance.3.nom,
                                               etablissements_soutenance.4.nom,
                                               sep = ";")][,etablissements_soutenance.nom := gsub(pattern = ";+$",
                                                                                                 replacement = "",
                                                                                                 etablissements_soutenance.nom)]
  data[,`:=`(etablissements_soutenance.0.nom = NULL,
             etablissements_soutenance.1.nom = NULL,
             etablissements_soutenance.2.nom = NULL,
             etablissements_soutenance.3.nom = NULL,
             etablissements_soutenance.4.nom = NULL)]

  data[,langues := paste(langues.0,
                         langues.1,
                         langues.2,
                         langues.3,
                         sep = ";")][,langues := gsub(pattern = ";+$",
                                                     replacement = "",
                                                     langues)]
  data[,`:=`(langues.0 = NULL,
             langues.1 = NULL,
             langues.2 = NULL,
             langues.3 = NULL)]

  data[,membres_jury.idref := paste(membres_jury.0.idref,
                                    membres_jury.1.idref,
                                    membres_jury.2.idref,
                                    membres_jury.3.idref,
                                    membres_jury.4.idref,
                                    membres_jury.5.idref,
                                    membres_jury.6.idref,
                                    membres_jury.7.idref,
                                    membres_jury.8.idref,
                                    membres_jury.9.idref,
                                    membres_jury.10.idref,
                                    membres_jury.11.idref,
                                    sep = ";")][,membres_jury.idref := gsub(pattern = ";+$",
                                                                           replacement = "",
                                                                           membres_jury.idref)]
  data[,`:=`(membres_jury.0.idref = NULL,
             membres_jury.1.idref = NULL,
             membres_jury.2.idref = NULL,
             membres_jury.3.idref = NULL,
             membres_jury.4.idref = NULL,
             membres_jury.5.idref = NULL,
             membres_jury.6.idref = NULL,
             membres_jury.7.idref = NULL,
             membres_jury.8.idref = NULL,
             membres_jury.9.idref = NULL,
             membres_jury.10.idref = NULL,
             membres_jury.11.idref = NULL)]

  data[,membres_jury.nom := paste(membres_jury.0.nom,
                                  membres_jury.1.nom,
                                  membres_jury.2.nom,
                                  membres_jury.3.nom,
                                  membres_jury.4.nom,
                                  membres_jury.5.nom,
                                  membres_jury.6.nom,
                                  membres_jury.7.nom,
                                  membres_jury.8.nom,
                                  membres_jury.9.nom,
                                  membres_jury.10.nom,
                                  membres_jury.11.nom,
                                  sep = ";")][,membres_jury.nom := gsub(pattern = ";+$",
                                                                       replacement = "",
                                                                       membres_jury.nom)]
  data[,`:=`(membres_jury.0.nom = NULL,
             membres_jury.1.nom = NULL,
             membres_jury.2.nom = NULL,
             membres_jury.3.nom = NULL,
             membres_jury.4.nom = NULL,
             membres_jury.5.nom = NULL,
             membres_jury.6.nom = NULL,
             membres_jury.7.nom = NULL,
             membres_jury.8.nom = NULL,
             membres_jury.9.nom = NULL,
             membres_jury.10.nom = NULL,
             membres_jury.11.nom = NULL)]

  data[,membres_jury.prenom := paste(membres_jury.0.prenom,
                                     membres_jury.1.prenom,
                                     membres_jury.2.prenom,
                                     membres_jury.3.prenom,
                                     membres_jury.4.prenom,
                                     membres_jury.5.prenom,
                                     membres_jury.6.prenom,
                                     membres_jury.7.prenom,
                                     membres_jury.8.prenom,
                                     membres_jury.9.prenom,
                                     membres_jury.10.prenom,
                                     membres_jury.11.prenom,
                                     sep = ";")][,membres_jury.prenom := gsub(pattern = ";+$",
                                                                             replacement = "",
                                                                             membres_jury.prenom)]
  data[,`:=`(membres_jury.0.prenom = NULL,
             membres_jury.1.prenom = NULL,
             membres_jury.2.prenom = NULL,
             membres_jury.3.prenom = NULL,
             membres_jury.4.prenom = NULL,
             membres_jury.5.prenom = NULL,
             membres_jury.6.prenom = NULL,
             membres_jury.7.prenom = NULL,
             membres_jury.8.prenom = NULL,
             membres_jury.9.prenom = NULL,
             membres_jury.10.prenom = NULL,
             membres_jury.11.prenom = NULL)]


  data[,partenaires_recherche.idref := paste(partenaires_recherche.0.idref,
                                             partenaires_recherche.1.idref,
                                             partenaires_recherche.2.idref,
                                             partenaires_recherche.3.idref,
                                             partenaires_recherche.4.idref,
                                             partenaires_recherche.5.idref,
                                             partenaires_recherche.6.idref,
                                             partenaires_recherche.7.idref,
                                             sep = ";")][,partenaires_recherche.idref := gsub(pattern = ";+$",
                                                                                             replacement = "",
                                                                                             partenaires_recherche.idref)]
  data[,`:=`(partenaires_recherche.0.idref = NULL,
             partenaires_recherche.1.idref = NULL,
             partenaires_recherche.2.idref = NULL,
             partenaires_recherche.3.idref = NULL,
             partenaires_recherche.4.idref = NULL,
             partenaires_recherche.5.idref = NULL,
             partenaires_recherche.6.idref = NULL,
             partenaires_recherche.7.idref = NULL)]

  data[,partenaires_recherche.nom := paste(partenaires_recherche.0.nom,
                                           partenaires_recherche.1.nom,
                                           partenaires_recherche.2.nom,
                                           partenaires_recherche.3.nom,
                                           partenaires_recherche.4.nom,
                                           partenaires_recherche.5.nom,
                                           partenaires_recherche.6.nom,
                                           partenaires_recherche.7.nom,
                                           sep = ";")][,partenaires_recherche.nom := gsub(pattern = ";+$",
                                                                                         replacement = "",
                                                                                         partenaires_recherche.nom)]
  data[,`:=`(partenaires_recherche.0.nom = NULL,
             partenaires_recherche.1.nom = NULL,
             partenaires_recherche.2.nom = NULL,
             partenaires_recherche.3.nom = NULL,
             partenaires_recherche.4.nom = NULL,
             partenaires_recherche.5.nom = NULL,
             partenaires_recherche.6.nom = NULL,
             partenaires_recherche.7.nom = NULL)]

  data[,partenaires_recherche.type := paste(partenaires_recherche.0.type,
                                            partenaires_recherche.1.type,
                                            partenaires_recherche.2.type,
                                            partenaires_recherche.3.type,
                                            partenaires_recherche.4.type,
                                            partenaires_recherche.5.type,
                                            partenaires_recherche.6.type,
                                            partenaires_recherche.7.type,
                                            sep = ";")][,partenaires_recherche.type := gsub(pattern = ";+$",
                                                                                           replacement = "",
                                                                                           partenaires_recherche.type)]
  data[,`:=`(partenaires_recherche.0.type = NULL,
             partenaires_recherche.1.type = NULL,
             partenaires_recherche.2.type = NULL,
             partenaires_recherche.3.type = NULL,
             partenaires_recherche.4.type = NULL,
             partenaires_recherche.5.type = NULL,
             partenaires_recherche.6.type = NULL,
             partenaires_recherche.7.type = NULL)]

  data[,rapporteurs.idref := paste(rapporteurs.0.idref,
                                   rapporteurs.1.idref,
                                   rapporteurs.2.idref,
                                   rapporteurs.3.idref,
                                   rapporteurs.4.idref,
                                   rapporteurs.5.idref,
                                   sep = ";")][,rapporteurs.idref := gsub(pattern = ";+$",
                                                                         replacement = "",
                                                                         rapporteurs.idref)]
  data[,`:=`(rapporteurs.0.idref = NULL,
             rapporteurs.1.idref = NULL,
             rapporteurs.2.idref = NULL,
             rapporteurs.3.idref = NULL,
             rapporteurs.4.idref = NULL,
             rapporteurs.5.idref = NULL)]

  data[,rapporteurs.nom := paste(rapporteurs.0.nom,
                                 rapporteurs.1.nom,
                                 rapporteurs.2.nom,
                                 rapporteurs.3.nom,
                                 rapporteurs.4.nom,
                                 rapporteurs.5.nom,
                                 sep = ";")][,rapporteurs.nom := gsub(pattern = ";+$",
                                                                       replacement = "",
                                                                     rapporteurs.nom)]
  data[,`:=`(rapporteurs.0.nom = NULL,
             rapporteurs.1.nom = NULL,
             rapporteurs.2.nom = NULL,
             rapporteurs.3.nom = NULL,
             rapporteurs.4.nom = NULL,
             rapporteurs.5.nom = NULL)]


  data[,rapporteurs.prenom := paste(rapporteurs.0.prenom,
                                    rapporteurs.1.prenom,
                                    rapporteurs.2.prenom,
                                    rapporteurs.3.prenom,
                                    rapporteurs.4.prenom,
                                    rapporteurs.5.prenom,
                                    sep = ";")][,rapporteurs.prenom := gsub(pattern = ";+$",
                                                                        replacement = "",
                                                                        rapporteurs.prenom)]
  data[,`:=`(rapporteurs.0.prenom = NULL,
             rapporteurs.1.prenom = NULL,
             rapporteurs.2.prenom = NULL,
             rapporteurs.3.prenom = NULL,
             rapporteurs.4.prenom = NULL,
             rapporteurs.5.prenom = NULL)]



  data[,resumes.autre := paste(resumes.autre.0,
                               resumes.autre.1,
                               resumes.autre.2,
                               resumes.autre.3,
                               resumes.autre.4,
                               resumes.autre.5,
                               sep = ";")][,resumes.autre := gsub(pattern = ";+$",
                                                                      replacement = "",
                                                                 resumes.autre)]
  data[,`:=`(resumes.autre.0 = NULL,
             resumes.autre.1 = NULL,
             resumes.autre.2 = NULL,
             resumes.autre.3 = NULL,
             resumes.autre.4 = NULL,
             resumes.autre.5 = NULL)]


  data[,sujets.autre := paste(sujets.autre.0,
                              sujets.autre.1,
                              sujets.autre.2,
                              sujets.autre.3,
                              sujets.autre.4,
                              sujets.autre.5,
                              sujets.autre.6,
                              sujets.autre.7,
                              sep = ";")][,sujets.autre := gsub(pattern = ";+$",
                                                                replacement = "",
                                                               sujets.autre)]
  data[,`:=`(sujets.autre.0 = NULL,
             sujets.autre.1 = NULL,
             sujets.autre.2 = NULL,
             sujets.autre.3 = NULL,
             sujets.autre.4 = NULL,
             sujets.autre.5 = NULL,
             sujets.autre.6 = NULL,
             sujets.autre.7 = NULL)]


  data[,sujets_rameau := paste(sujets_rameau.0,
                               sujets_rameau.1,
                               sujets_rameau.2,
                               sujets_rameau.3,
                               sujets_rameau.4,
                               sujets_rameau.5,
                               sujets_rameau.6,
                               sujets_rameau.7,
                               sujets_rameau.8,
                               sujets_rameau.9,
                               sujets_rameau.10,
                               sujets_rameau.11,
                               sujets_rameau.12,
                               sujets_rameau.13,
                               sujets_rameau.14,
                               sujets_rameau.15,
                               sujets_rameau.16,
                               sujets_rameau.17,
                               sujets_rameau.18,
                               sujets_rameau.19,
                               sujets_rameau.20,
                               sujets_rameau.21,
                               sujets_rameau.22,
                               sujets_rameau.23,
                               sujets_rameau.24,
                               sujets_rameau.25,
                               sujets_rameau.26,
                               sujets_rameau.27,
                               sujets_rameau.28,
                               sujets_rameau.29,
                               sujets_rameau.30,
                               sujets_rameau.31,
                               sujets_rameau.32,
                               sujets_rameau.33,
                               sujets_rameau.34,
                               sujets_rameau.35,
                               sujets_rameau.36,
                               sujets_rameau.37,
                               sujets_rameau.38,
                               sujets_rameau.39,
                               sujets_rameau.40,
                               sujets_rameau.41,
                               sujets_rameau.42,
                               sujets_rameau.43,
                               sujets_rameau.44,
                               sujets_rameau.45,
                               sujets_rameau.46,
                               sujets_rameau.47,
                               sujets_rameau.48,
                               sujets_rameau.49,
                               sujets_rameau.50,
                               sujets_rameau.51,
                               sujets_rameau.52,
                               sujets_rameau.53,
                               sujets_rameau.54,
                               sep = ";")][,sujets_rameau := gsub(pattern = ";+$",
                                                                replacement = "",
                                                                sujets_rameau)]

  data[,`:=`(sujets_rameau.0 = NULL,
             sujets_rameau.1 = NULL,
             sujets_rameau.2 = NULL,
             sujets_rameau.3 = NULL,
             sujets_rameau.4 = NULL,
             sujets_rameau.5 = NULL,
             sujets_rameau.6 = NULL,
             sujets_rameau.7 = NULL,
             sujets_rameau.8 = NULL,
             sujets_rameau.9 = NULL,
             sujets_rameau.10 = NULL,
             sujets_rameau.11 = NULL,
             sujets_rameau.12 = NULL,
             sujets_rameau.13 = NULL,
             sujets_rameau.14 = NULL,
             sujets_rameau.15 = NULL,
             sujets_rameau.16 = NULL,
             sujets_rameau.17 = NULL,
             sujets_rameau.18 = NULL,
             sujets_rameau.19 = NULL,
             sujets_rameau.20 = NULL,
             sujets_rameau.21 = NULL,
             sujets_rameau.22 = NULL,
             sujets_rameau.23 = NULL,
             sujets_rameau.24 = NULL,
             sujets_rameau.25 = NULL,
             sujets_rameau.26 = NULL,
             sujets_rameau.27 = NULL,
             sujets_rameau.28 = NULL,
             sujets_rameau.29 = NULL,
             sujets_rameau.30 = NULL,
             sujets_rameau.31 = NULL,
             sujets_rameau.32 = NULL,
             sujets_rameau.33 = NULL,
             sujets_rameau.34 = NULL,
             sujets_rameau.35 = NULL,
             sujets_rameau.36 = NULL,
             sujets_rameau.37 = NULL,
             sujets_rameau.38 = NULL,
             sujets_rameau.39 = NULL,
             sujets_rameau.40 = NULL,
             sujets_rameau.41 = NULL,
             sujets_rameau.42 = NULL,
             sujets_rameau.43 = NULL,
             sujets_rameau.44 = NULL,
             sujets_rameau.45 = NULL,
             sujets_rameau.46 = NULL,
             sujets_rameau.47 = NULL,
             sujets_rameau.48 = NULL,
             sujets_rameau.49 = NULL,
             sujets_rameau.50 = NULL,
             sujets_rameau.51 = NULL,
             sujets_rameau.52 = NULL,
             sujets_rameau.53 = NULL,
             sujets_rameau.54 = NULL)]



  data[,titres.autre := paste(titres.autre.0,
                              titres.autre.1,
                              titres.autre.2,
                              titres.autre.3,
                              sep = ";")][,titres.autre := gsub(pattern = ";+$",
                                                                replacement = "",
                                                               titres.autre)]
  data[,`:=`(titres.autre.0 = NULL,
             titres.autre.1 = NULL,
             titres.autre.2 = NULL,
             titres.autre.3 = NULL)]

  data_chems <- list_chems()
  data[, chems := ""]
  # Loop through each chemical name in data_chems
  for (i in 1:nrow(data_chems)) {
    chem_name <- data_chems[i, nom]
    data[str_detect(string = tolower(resumes.fr), pattern = tolower(chem_name)), chems := paste(chems,str_to_sentence(chem_name),sep = ";")]
  }

  data_vegs <- list_vegs()
  data[, vegs := ""]
  # Loop through each chemical name in data_chems
  for (i in 1:nrow(data_vegs)) {
    veg_name <- data_vegs[i, nom]
    data[str_detect(string = tolower(resumes.fr), pattern = tolower(veg_name)), vegs := paste(vegs,str_to_sentence(veg_name),sep =";")]
  }

  data_pathogenes <- list_pathogenes()
  data[, pathogenes := ""]
  # Loop through each chemical name in data_chems
  for (i in 1:nrow(data_pathogenes)) {
    pathogene_name <- data_pathogenes[i, nom]
    data[str_detect(string = tolower(resumes.fr), pattern = tolower(pathogene_name)), pathogenes := paste(pathogenes,str_to_sentence(pathogene_name),sep = ";")]
  }

  data_tech <- list_tech()
  data[, techs := ""]
  # Loop through each chemical name in data_chems
  for (i in 1:nrow(data_tech)) {
    tech_name <- data_tech[i, nom]
    data[str_detect(string = tolower(resumes.fr), pattern = tolower(tech_name)), techs := paste(techs,str_to_sentence(tech_name),sep = ";")]
  }


  data[, chems := gsub("^;", "", chems)]
  data[, vegs := gsub("^;", "", vegs)]
  data[, pathogenes := gsub("^;", "", pathogenes)]
  data[, techs := gsub("^;", "", techs)]



  data_light <- data[, .(discipline,
                         chems,
                         sujets.fr,
                         vegs,
                         pathogenes,
                         techs,
                         sujets_rameau,
                         auteur.nom,
                         auteur.prenom,
                         date_soutenance,
                         titres.fr,
                         nnt)]

  # write_parquet(data,"data/theses-soutenues-compact.parquet")
  # write.fst(data,"data/theses-soutenues-compact.fst",compress = 100)

  # write_parquet(data[,.(resumes.en,resumes.fr)],"data/theses-resumes.parquet")

  write.fst(data_light[,.N,discipline][order(N,decreasing = TRUE)],"data/nb_disciplines.fst")
  write.fst(data_light[,.N,chems][order(N,decreasing = TRUE)],"data/nb_chems.fst")
  write.fst(data_light[,.N,sujets.fr][order(N,decreasing = TRUE)],"data/nb_sujets.fr.fst")
  write.fst(data_light[,.N,vegs][order(N,decreasing = TRUE)],"data/nb_vegs.fst")
  write.fst(data_light[,.N,pathogenes][order(N,decreasing = TRUE)],"data/nb_pathogenes.fst")
  write.fst(data_light[,.N,techs][order(N,decreasing = TRUE)],"data/nb_techs.fst")
  write.fst(data_light[,.N,sujets_rameau][order(N,decreasing = TRUE)],"data/nb_sujets_rameau.fst")

  write.fst(data_light,"data/theses-soutenues-compact-light.fst",compress = 100)
  # write_parquet(data_light,"data/theses-soutenues-compact-light.parquet")




}

