#!/usr/bin/env bash
apps=(
    "duck_docker"
    "duck_crispy_forms"
    "helpdesk"
    "xadmin"
    "django_apogee"
    "duck_examen"
    "foad"
    "duck_inscription"
    "duck_inscription_payzen"
    "duck_personnel"
    "duck_recruitment"
    "duck_salle"
    "duck_site"
    "duck_svi"
    "duck_theme_ied"
    "gestion_info"
    "duck_loader"
    )

for app in ${apps[*]}
do
cd ../$app && git pull && cd ../duck_docker
done