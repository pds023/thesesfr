
#' Title
#'
#' @return
#' @export
#'
#' @examples
list_tech <- function() {
  #ça va pas du tout
  tech <- as.data.table(rbind(c("radio adaptative","Communication de pointe"),
                              c("radio cognitive","Communication de pointe"),
                              c("radio intelligente","Communication de pointe"),
                              c("système massif à entrées multiples","Communication de pointe"),
                              c("système massif à sorties multiples","Communication de pointe"),
                              c("spectre des ondes millimétriques","Communication de pointe"),
                              c("réseaux d’accès radio ouverts","Communication de pointe"),
                              c("réseaux d’accès radio virtualisés","Communication de pointe"),
                              c("communications optiques","Communication de pointe"),
                              c("communications photoniques","Communication de pointe"),
                              c("communications haute fréquence à large bande","Communication de pointe"),


                              c("informatique sensible au contexte","Informatique de pointe"),
                              c("calcul en périphérie de réseau","Informatique de pointe"),
                              c("calcul de haute performance","Informatique de pointe"),
                              c("calcul neuromorphique","Informatique de pointe"),

                              c("chiffrement biométrique","Cryptographie"),
                              c("chiffrement fondé sur l’ADN","Cryptographie"),
                              c("cryptographie postquantique","Cryptographie"),
                              c("chiffrement homomorphique","Cryptographie"),
                              c("chiffrement optique furtif","Cryptographie"),

                              c("Cyberdéfense","Cybersécurité"),
                              c("Solutions intersectorielles","Cybersécurité"),
                              c("technologies de défense des cibles mobiles","Cybersécurité"),

                              c("Stockage optique en cinq dimensions","Stockage des données"),
                              c("Stockage optique en 5D","Stockage des données"),
                              c("Stockage de l'ADN","Stockage des données"),
                              c("aimants monomoléculaires","Stockage des données"),

                              c("Chaînes de blocs","Registre distribué"),
                              c("Blockchain","Registre distribué"),
                              c("cryptomonnaies","Registre distribué"),
                              c("monnaies numériques","Registre distribué"),
                              c("jetons non fongibles","Registre distribué"),

                              c("composants photoniques","Microélectronique"),
                              c("semi-conducteurs","Microélectronique"),
                              c("puces à mémoire empilée","Microélectronique"),

                              c("piles à combustible","Stockage de l’énergie"),
                              c("batteries biodégradables","Stockage de l’énergie"),
                              c("batteries graphène-aluminium-ion","Stockage de l’énergie"),
                              c("batteries lithium-air","Stockage de l’énergie"),
                              c("batteries en métal liquide","Stockage de l’énergie"),
                              c("batteries à l’état solide","Stockage de l’énergie"),
                              c("batteries structurelles","Stockage de l’énergie"),
                              c("supercondensateurs","Stockage de l’énergie"),
                              c("ultracondensateurs","Stockage de l’énergie"),

                              c("fusion nucléaire","énergie nucléaire"),
                              c("réacteurs modulaires","énergie nucléaire"),

                              c("Matériaux auxétiques","Matériaux"),
                              c("Alliages à haute entropie","Matériaux"),
                              c("Métamatériaux","Matériaux"),
                              c("fluide magnétorhéologique","Matériaux"),
                              c("alliage à mémoire de forme","Matériaux"),
                              c("polymère à mémoire de forme","Matériaux"),
                              c("matériaux autoassemblés","Matériaux"),
                              c("Nanomatériaux","Matériaux"),
                              c("supraconducteurs","Matériaux"),
                              c("Matériaux bidimensionnels","Matériaux"),
                              c("silicène","Matériaux"),
                              c("germanène","Matériaux"),
                              c("stantène","Matériaux"),
                              c("Borophène","Matériaux"),
                              c("Phosphorène","Matériaux"),

                              c("Fabrication additive","Fabrication"),
                              c("Impression 3D","Fabrication"),
                              c("lithographie par ultraviolets","Fabrication"),
                              c("Impression en quatre dimensions","Fabrication"),
                              c("Impression en 4D","Fabrication"),
                              c("Nanofabrication","Fabrication"),
                              c("Matériaux bidimensionnels","Fabrication"),

                              c("reconnaissance biométrique","Surveillance"),
                              c("réseaux actifs à balayage électronique","Surveillance"),
                              c("radars cognitifs","Surveillance"),
                              c("radars à ondes ionosphériques","Surveillance"),
                              c("radars transhorizon","Surveillance"),
                              c("radars passifs","Surveillance"),
                              c("radars à synthèse d’ouverture","Surveillance"),
                              c("interféromètre atomiques","Surveillance"),
                              c("signalisation réciproque d’objectifs","Surveillance"),
                              c("rayonnement électromagnétique","Surveillance"),
                              c("infrarouge","Surveillance"),
                              c("magnétomètres","Surveillance"),
                              c("horloges atomiques","Surveillance"),
                              c("navigation inertielle","Surveillance"),
                              c("navigation sous-marine à longue portée","Surveillance"),
                              c("anomalie magnétique","Surveillance"),
                              c("Sonar à balayage latéral","Surveillance"),
                              c("Sonar à synthèse d’ouverture","Surveillance"),

                              c("énergie dirigée","Armes"),
                              c("hypersonique","Armes"),
                              c("armes autonomes","Armes"),

                              c("moteurs à détonation pulsée","Propulsion"),
                              c("propulsion nucléaire thermique","Propulsion"),
                              c("propulsion nucléaire pulsée","Propulsion"),
                              c("propulsion nucléaire électrique","Propulsion"),

                              c("distribution quantique des clés","Quantique"),
                              c("qubits","Quantique"),
                              c("qubits","Quantique")))

  colnames(tech) <- c("nom","type")

  return(tech)
}




