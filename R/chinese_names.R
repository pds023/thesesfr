

#' Title
#'
#' @return
#' @export
#' @import ChineseNames pinyin
#' @examples
chinese_names <- function() {
  noms <- ChineseNames::familyname$surname
  prenoms <- ChineseNames::givenname$character

  noms.py <- as.data.table(py(noms,dic = pydic(method = "toneless")))
  prenoms.py <- as.data.table(py(prenoms,dic = pydic(method = "toneless")))

  colnames(noms.py) <- "nom"
  colnames(prenoms.py) <- "prenom"

  noms.py <- noms.py[!duplicated(nom)]
  prenoms.py <- prenoms.py[!duplicated(prenom)]

  noms.py <- noms.py[,nom := gsub(pattern = "_",replacement = " ",nom)]
  prenoms.py <- prenoms.py[,prenom := gsub(pattern = "_",replacement = " ",prenom)]

  return(list(noms.py,prenoms.py))
}


