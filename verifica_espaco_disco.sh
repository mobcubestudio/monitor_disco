#!/bin/sh
. ./parametros.lib
cd $LOCAL_BOT
data_hora=$(date)
echo -e $data_hora
moderado=$ESPACO_DISCO_MODERADO
critico=$ESPACO_DISCO_CRITICO

df -H $NOME_DISCO | grep -vE '^Filesystem|tmpfs|cdrom|loop|Disp' | awk '{ print $5 " " $1 }' | while read retorno;
do
	#echo $retorno
	espaco_ocupado=$(echo $retorno | awk '{ print $1}' | cut -d'%' -f1  )
	espaco_disponivel=$(expr 100 - $espaco_ocupado)

	if [ $espaco_disponivel -le $moderado -a $espaco_disponivel -gt $critico ]; then
		
		  titulo="ALERTA MODERADO DE ESPAÇO EM DISCO"
		  mensagem="Espaço disponível: ${espaco_disponivel}%"
		  icone="--icon=${LOCAL_BOT}/icons/moderate.png"
			notify-send -t 10000 $icone "$titulo" "$mensagem"


		bash push_notification.sh "$titulo" "$mensagem"

		
	elif [ $espaco_disponivel -le $critico ]; then


			titulo="ALERTA CRÍTICO DE ESPAÇO EM DISCO"
      mensagem="Espaço disponível: ${espaco_disponivel}%"
      icone="--icon=${LOCAL_BOT}/icons/critical.png"
      notify-send -t 10000 $icone "$titulo" "$mensagem"

      bash push_notification.sh "$titulo" "$mensagem"
		
	fi # if [ $espaco_disponivel -lt $moderado -a $espaco_disponivel -gt $critico ] | elif [ $espaco_disponivel -le $critico ]
done


