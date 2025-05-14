cd "C:\Users\DAVID\Desktop\PARCOURS ISE\ISEP\ISEP2_2024_2025\SEMESTRE 2\INFORMATIQUE\PROGRAMMATION AVEC R\ISEP2025\ISEP2025\EXPOSE_David Landry SANAM"

use "s00_me_SEN2018.dta", clear
use "s01_me_SEN2018.dta", clear
use "s02_me_SEN2018.dta", clear
use "s03_me_SEN2018.dta", clear
use "s04_me_SEN2018.dta", clear





codebook s01q03c
codebook s01q01
br




/**********************************************
* PROGRAMME FINAL - ANALYSE EHCVM SENEGAL *
* Correction des problèmes de merge *
**********************************************/

* 1. INITIALISATION
* --------------------------------------------------
version 17
clear all
set more off
capture log close
set linesize 255
set maxvar 10000

* Créer un journal
log using "analyse_ehcvm_corrected.log", replace text

* 2. CONFIGURATION DES CHEMINS
* --------------------------------------------------
global basepath "C:\Users\DAVID\Desktop\PARCOURS ISE\ISEP\ISEP2_2024_2025\SEMESTRE 2\INFORMATIQUE\PROGRAMMATION AVEC R\ISEP2025\ISEP2025\EXPOSE_David Landry SANAM"
global data "$basepath/Data"
global results "$basepath/Results"
global graphs "$basepath/Graphs"

capture mkdir "$data"
capture mkdir "$results"
capture mkdir "$graphs"

* 3. CHARGEMENT ET PREPARATION DES DONNEES
* --------------------------------------------------
* Section 0 - Ménages
use "$data/s00_me_SEN2018.dta", clear
gen id_menage = string(vague) + "_" + string(grappe) + "_" + string(menage)
save "$data/temp_s00.dta", replace

* Section 1 - Caractéristiques individuelles
use "$data/s01_me_SEN2018.dta", clear
gen id_ind = string(vague) + "_" + string(grappe) + "_" + string(menage) + "_" + string(s01q00a)
save "$data/temp_s01.dta", replace

* Section 2 - Education
use "$data/s02_me_SEN2018.dta", clear
gen id_ind = string(vague) + "_" + string(grappe) + "_" + string(menage) + "_" + string(s01q00a)
save "$data/temp_s02.dta", replace

* Section 4 - Emploi
use "$data/s04_me_SEN2018.dta", clear
gen id_ind = string(vague) + "_" + string(grappe) + "_" + string(menage) + "_" + string(s01q00a)
save "$data/temp_s04.dta", replace

* 4. FUSION CORRIGEE DES DONNEES
* --------------------------------------------------
* Fusion 1:1 des sections individuelles
use "$data/temp_s01.dta", clear

* Fusion avec section2 avec contrôle d'erreur
capture noisily merge 1:1 id_ind using "$data/temp_s02.dta", assert(match) nogenerate
if _rc != 0 {
    di as error "Erreur dans la fusion avec temp_s02"
    error _rc
}

* Fusion avec section4 avec gestion des labels
label drop _all
capture noisily merge 1:1 id_ind using "$data/temp_s04.dta", assert(match) nogenerate
if _rc != 0 {
    di as error "Erreur dans la fusion avec temp_s04"
    error _rc
}

* Création identifiant ménage compatible
gen id_menage = string(vague) + "_" + string(grappe) + "_" + string(menage)

* Fusion m:1 avec données ménage
capture noisily merge m:1 id_menage using "$data/temp_s00.dta", assert(match using) nogenerate
if _rc != 0 {
    di as error "Erreur dans la fusion avec temp_s00"
    error _rc
}

* 5. NETTOYAGE ET RECODAGE (inchangé)
* --------------------------------------------------
* ... (le reste du code de recodage reste identique) ...

* 6. SAUVEGARDE DU FICHIER FINAL
* --------------------------------------------------
save "$data/base_finale.dta", replace

* 7. NETTOYAGE
* --------------------------------------------------
capture erase "$data/temp_s00.dta"
capture erase "$data/temp_s01.dta"
capture erase "$data/temp_s02.dta"
capture erase "$data/temp_s04.dta"

log close
display as text "Traitement terminé avec succès"