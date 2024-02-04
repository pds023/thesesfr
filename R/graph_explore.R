

#' Title
#'
#' @param data
#' @param input_switch
#' @param input_pct
#'
#' @return
#' @export
#'
#' @examples
graph_explore <- function(data,
                          input_type,
                          input_pct,
                          nb_lignes = 30,
                          group = FALSE) {
  if(!group){
    colnames(data) <- c("var","N")
    data[,pct := round(N/sum(N),2)]
    if(input_type %in% "bar"){
      if(input_pct %in% "niv") {
        return(hchart(data[1:nb_lignes], type = "bar",hcaes(x = var, y = N)))
      } else {
        return(hchart(data[1:nb_lignes], type = "bar",hcaes(x = var, y = pct)))
      }
    }else{
      data_treemap <- data_to_hierarchical(data[1:nb_lignes], c("var", "N"))
      return(hchart(data_treemap, type = "treemap"))
    }
  } else {
    colnames(data) <- c("agreg","var","N")
    data[,pct := round(N/sum(N),2)]
    if(input_type %in% "bar"){
      if(input_pct %in% "niv") {
        return(hchart(data[1:nb_lignes], type = "bar",hcaes(x = var, y = N, group = agreg)))
      } else {
        return(hchart(data[1:nb_lignes], type = "bar",hcaes(x = var, y = pct, group = agreg)))
      }
    }else{
      data_treemap <- data_to_hierarchical(data[1:nb_lignes],group_vars = c("agreg","var"), size_var = "N")
      return(hchart(data_treemap, type = "treemap"))
    }
  }
}
