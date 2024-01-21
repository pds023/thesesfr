
#' Title
#'
#' @return
#' @export
#'
#' @examples
list_vegs <- function() {
  #ça va pas du tout

  vegs <- as.data.table(rbind(c("Xanthomonas albilineans","Bactérie"),
                                     c("Xanthomonas axonopodis","Bactérie"),
                                     c("Xanthomonas campestris","Bactérie"),
                                     c("Xanthomonas oryzae","Bactérie"),
                                     c("Pseudomonas campestris","Bactérie"),
                                     c("Clavibacter michiganensis","Bactérie"),
                                     c("Corynebacterium michiganensis","Bactérie"),
                                     c("Ralstonia solanacearum","Bactérie"),
                                     c("Colletotrichum kahawae","Champignon"),
                                     c("Colletotrichum coffeanum","Champignon"),
                                     c("Cochliobolus miyabeanus","Champignon"),
                                     c("Helminthosporium oryzae","Champignon"),
                                     c("Microcyclus ulei","Champignon"),
                                     c("Dothidella ulei","Champignon"),
                                     c("Puccinia graminis","Champignon"),
                                     c("Puccinia striiformis","Champignon"),
                                     c("Magnaporthe oryzae","Champignon"),
                                     c("Pyricularia oryzae","Champignon"),
                                     c("Peronosclerospora philippinensis","Champignon"),
                                     c("Peronosclerospora sacchari","Champignon"),
                                     c("Sclerophtora rayssiae","Champignon"),
                                     c("Synchytrium endobioticum","Champignon"),
                                     c("Tilletia indica","Champignon"),
                                     c("Thecaphora solani","Champignon")))

  colnames(vegs) <- c("nom","type")

  return(vegs)
}


