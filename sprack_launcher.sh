#!/bin/bash
clear
echo "==============================="
echo "     SprackedAttack Toolkit    "
echo "==============================="

PS3='Choose a tool: '
options=("Nmap" "Hydra" "SQLMap" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Nmap")
            echo "Running Nmap..."
            read -p "Enter target IP or domain: " target
            nmap -A $target
            ;;
        "Hydra")
            echo "Running Hydra..."
            read -p "Enter target IP: " target
            read -p "Enter service (ssh, ftp, etc): " service
            read -p "Enter username: " user
            read -p "Enter path to password list: " passlist
            hydra -l $user -P $passlist $target $service
            ;;
        "SQLMap")
            echo "Running SQLMap..."
            read -p "Enter target URL: " url
            python tools/sqlmap/sqlmap.py -u "$url" --batch --banner
            ;;
        "Exit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done
