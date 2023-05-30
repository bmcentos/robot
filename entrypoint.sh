#!/bin/sh

cd /app
ls -la

if [ -f cert.pem ] ; then
        echo "[+] Importando certificado: cert.pem"
        cat cert.pem >> /etc/ssl/certs/ca-certificates.crt
        update-ca-certificates
fi
if [ ! -f requirements.txt ] ; then
        echo "[-] Requirements não existe!"
else
  pip install -r requirements.txt
fi
# Fazer a chamada selecionando o arquivo .robot

if [ -z $1 ] ; then
  echo "[-] Por favor, fazer a chamada passando o nome do arquivo!"
  echo "   [+] docker run  -v $(pwd):/app:cached -w /app  test test.robot"
  exit 1
fi

python3 -m robot $1
