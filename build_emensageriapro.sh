#!/bin/bash
#
# Build a emensageriapro with placeholder objects
# and an admin user with username 'admin', password 'admin'.
#
# Requires that a postgreSQL database has been created for the emensageriapro
# By: Ananias Filho (ananias@kmee.com.br)
virtualenv .
source bin/activate
set -e
echo -e "DEBUG=on
SECRET_KEY='2w0qr9j#u2e=q081@sk)^-t3g9p5+k0+k9-b=yx4*aw!j=dsm$'
#DATABASE_URL=psql://emensageriapro:debug1234@db:5432/emensageriapro_db
DATABASE_URL=psql://ananias:@localhost:5432/travisdb
ALLOWED_HOSTS=emensageriapro-dev.org.br
EMAIL_HOST=smtp.endereco.com.br
EMAIL_HOST_USER=contato@endereco.com.br
EMAIL_HOST_PASSWORD=senha_email
EMAIL_PORT=587
EMAIL_USE_TLS=True
SERVER_EMAIL=contato@endereco.com.br
CERT_HOST=certificados/certificado_valido/certificado.pfx
CERT_PASS=senha_certificado
CERT_PEM_FILE=certificados/cert.pem
KEY_PEM_FILE=certificados/key.pem
CA_CERT_PEM_FILE=certificados/acserproacfv5.crt
TP_AMB=2
FORCE_PRODUCAO_RESTRITA=True
PASS_SCRIPT=senha_webservice
LINK_WEBSITE=http://emensageriapro-dev.org.br/
EMAIL_RECUPERACAO_SENHA=contato@emensageria.com.br
STATIC_ROOT=static/
STATIC_URL=/static/
MEDIA_ROOT=media/
MEDIA_URL=media/" > emensageriapro/.env
### Create directories
mkdir -p staticfiles media
### Install virtualenv
virtualenv sandbox --system-site-packages --no-setuptools --no-pip

rm -rf emensageriapro/migrations
mkdir -p media

pip install -r requirements.txt
python migrate_all_apps.py
