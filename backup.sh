#!/bin/bash

#Pede ao usuário o caminho da pasta a ser feito backup

clear

    read -p "Digite o caminho da pasta que deseja fazer o backup: " folder_path
    
#Verifica se o caminho existe e se é uma pasta

    if [ -d "$folder_path" ]; then
    
#Define o nome do arquivo de backup com base na data e hora atual

    #now=$(date +"%d/%m/%Y_%H:%M:%S")
    backup_file="$folder_path.tar.gz"
    
#Verifica se o arquivo de backup já existe

    if [ -e "$backup_file ]; then
    
        clear
        echo "Aguarde..."
        sleep 3
        clear
        
        echo "O arquivo de backup já existe. O backup será finalizado."
    else
  #Faz o backup da pasta e comprime em formato .tar.gz
  
        echo -czf "$backup_file" "$folder_path"
        clear
        echo "Aguarde..."
        sleep 3
        clear
  #Registra o log com a data e hora do backup
        echo "$(date +'%d/%m/%Y_%H:%M:%S') - Backup da pasta $folder_path efetuado com sucesso." >> backup_log.txt
    fi
 else
        echo "O caminho especificado não existe ou não é uma pasta valida."
    fi
  
