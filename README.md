# Monitoramento de espaço em disco
Monitoramento de espaço em disco em bash.


## parametros.lib
LOCAL_BOT={LOCAL DO SCRIPT}

NOME_DISCO={NOME DO HD} // use df -h

ESPACO_DISCO_MODERADO=30

ESPACO_DISCO_CRITICO=10


## push_notification.sh
// pushover.net

user="{SEU USUARIO}"

token="{SEU TOKEN}"

device_name="{SEUS DISPOSITIVOS}"


## crontab -e
m h  dom mon dow   command

* * * * * cd {LOCAL DO SCRIPT} && DISPLAY=:0.0 XDG_RUNTIME_DIR="/run/user/1000" XAUTHORITY="/run/user/1000/gdm/Xauthority" /bin/bash verifica_espaco_disco.sh
