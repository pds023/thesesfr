
#' Title
#'
#' @return
#' @export
#'
#' @examples
list_pathogenes <- function() {
  #ça va pas du tout

  vegs <- as.data.table(rbind(c("peste équine","Bactérie"),
                              c("peste porcine","Bactérie"),
                              c("Virus Andes","Bactérie"),
                              c("influenza aviaire2","Bactérie"),
                              c("fièvre catarrhale ovine","Bactérie"),
                              c("Chapare","Bactérie"),
                              c("Chikungunya","Bactérie"),
                              c("Virus Choclo","Bactérie"),
                              c("fièvre hémorragique de Crimée-Congo","Champignon"),
                              c("dengue","Champignon"),
                              c("Dobrava-Belgrade","Champignon"),
                              c("encéphalite équine de l'Est","Champignon"),
                              c("Ebola","Champignon"),
                              c("fièvre aphteuse","Champignon"),
                              c("variole caprine","Champignon"),
                              c("Guanarito","Champignon"),
                              c("Hantaan","Champignon"),
                              c("Hendra","Champignon"),
                              c("Herpesvirus porcin","Champignon"),
                              c("Aujeszky","Champignon"),
                              c("encéphalite japonaise","Champignon"),
                              c("Virus de Junin","Champignon"),
                              c("Kyasanur","Champignon"),
                              c("Laguna negra","Champignon"),
                              c("fièvre de Lassa","Champignon"),
                              c("encéphalomyélite ovine","Champignon"),
                              c("Virus Lujo","Champignon"),
                              c("encéphalomyélite ovine","Champignon"),
                              c("dermatose nodulaire","Champignon"),
                              c("chorioméningite lymphocytaire","Champignon"),
                              c("Machupo","Champignon"),
                              c("Marbourg","Champignon"),
                              c("variole du singe","Champignon"),
                              c("encéphalite de Murray Valley","Champignon"),
                              c("maladie de Newcastle","Champignon"),
                              c("Virus Nipah","Champignon"),
                              c("fièvre hémorragique d'Omsk","Champignon"),
                              c("Oropouche","Champignon"),
                              c("peste des petits ruminants","Champignon"),
                              c("Entérovirus porcin type 9","Champignon"),
                              c("maladie vésiculeuse du porc","Champignon"),
                              c("encéphalite Powassan","Champignon"),
                              c("Lyssavirus","Champignon"),
                              c("Virus de la vallée du Rift","Champignon"),
                              c("peste bovine","Champignon"),
                              c("Virus Rocio","Champignon"),
                              c("Virus Sabia","Champignon"),
                              c("Virus de Séoul","Champignon"),
                              c("variole ovine","Champignon"),
                              c("Virus Sin Nombre","Champignon"),
                              c("encéphalite de Saint-Louis","Champignon"),
                              c("maladie de Teschen","Champignon"),
                              c("encéphalomyélite à entérovirus","Champignon"),
                              c("encéphalite à tiques","Champignon"),
                              c("encéphalite verno-estivale russe","Champignon"),
                              c("variole","Champignon"),
                              c("encéphalite équine du Venezuela","Champignon"),
                              c("stomatite vésiculeuse","Champignon"),
                              c("encéphalite équine de l'Ouest","Champignon"),
                              c("encéphalite équine du Venezuela","Champignon")))

  colnames(vegs) <- c("nom","type")

  return(vegs)
}


