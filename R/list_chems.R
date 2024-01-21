
#' Title
#'
#' @return
#' @export
#'
#' @examples
list_chems <- function() {
  #ça va pas du tout

  precurseurs <- as.data.table(rbind(c("Thiodiglycol","2B"),
  c("Oxychlorure de phosphore","3B"),
  c("Méthylphosphonate de diméthyle","2B"),
  c("Difluorure de méthylphosphonyle","1B"),
  c("Dichlorure de méthylphosphonyle","2B"),
  c("Phosphite de diméthyle","3B"),
  c("Trichlorure de phosphore","3B"),
  c("Phosphite de triméthyle","3B"),
  c("Chlorure de thionyle","3B"),
  c("3-Hydroxy-1-méthylpipéridine","Non inscrit"),
  c("Chlorure de N,N-diisopropyl-2-aminoéthyle","2B"),
  c("N,N-Diisopropyl-2-aminoéthanethiol","2B"),
  c("Quinuclidin-3-ol","2B"),
  c("Fluorure de potassium","Non inscrit"),
  c("2-Chloroéthanol","Non inscrit"),
  c("Diméthylamine","Non inscrit"),
  c("Éthylphosphonate de diéthyle","2B"),
  c("N,N-Diméthylphosphoramidate de diéthyle","2B"),
  c("Phosphite de diéthyle","3B"),
  c("Chlorhydrate de diméthylamine","Non inscrit"),
  c("Dichlorure d’éthylphosphinyle","2B"),
  c("Dichlorure d’éthylphosphonyle","2B"),
  c("Difluorure d’éthylphosphonyle","1B"),
  c("Acide fluorhydrique","Non inscrit"),
  c("Benzilate de méthyle","Non inscrit"),
  c("Dichlorure de méthylphosphinyle","2B"),
  c("N,N-Diisopropyl-2-aminoéthanol","2B"),
  c("Alcool pinacolique","2B"),
  c("O-2-iisopropylaminoéthylméthylphosphonitede O-éthyle","1B"),
  c("Phosphite de triéthyle","3B"),
  c("Trichlorure d’arsenic","2B"),
  c("Acide benzilique","2B"),
  c("Méthylphosphonite de diéthyle","2B"),
  c("Éthylphosphonate de diméthyle","2B"),
  c("Difluorure d’éthylphosphinyle","2B"),
  c("Difluorure de méthylphosphinyle","2B"),
  c("Quinuclid-3-one","Non inscrit"),
  c("Pentachlorure de phosphore","3B"),
  c("Pinacolone","Non inscrit"),
  c("Cyanure de potassium","Non inscrit"),
  c("Bifluorure de potassium","Non inscrit"),
  c("Bifluorure d’ammonium","Non inscrit"),
  c("Bifluorure de sodium","Non inscrit"),
  c("Fluorure de sodium","Non inscrit"),
  c("Cyanure de sodium","Non inscrit"),
  c("Triéthanolamine","3B"),
  c("Pentasulfure de phosphore","Non inscrit"),
  c("Diisopropylamine","Non inscrit"),
  c("Diéthylaminoéthanol","Non inscrit"),
  c("Sulfure de sodium","Non inscrit"),
  c("Monochlorure de soufre","3B"),
  c("Dichlorure de soufre","3B"),
  c("Chlorhydrate de triéthanolamine","Non inscrit"),
  c("Chlorhydrate de chlorure de N,N-diisopropyl-2-aminoéthyle","2B"),
  c("Acide méthylphosphonique","2B"),
  c("Méthylphosphonate de diéthyle","2B"),
  c("Dichlorure de N,N-diméthylaminophosphoryle","2B"),
  c("Phosphite de triisopropyle","Non inscrit"),
  c("Éthyldiéthanolamine","3B"),
  c("Phosphorothioate de O,O-diéthyle","Non inscrit"),
  c("Phosphorodithioate de O,O-diéthyle","Non inscrit"),
  c("Hexafluorosilicate de sodium","Non inscrit"),
  c("Dichlorure méthylphosphonothioïque","2B")))

  colnames(precurseurs) <- c("nom","cac")

  return(precurseurs)
}


