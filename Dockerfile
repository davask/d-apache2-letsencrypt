FROM davask/d-apache2-openssl:2.4-u14.04
MAINTAINER davask <docker@davaskweblimited.com>
LABEL dwl.server.certificat="letsencrypt"

# declare letsencrypt
ENV DWL_CERTBOT_EMAIL docker@davaskweblimited.com
ENV DWL_CERTBOT_DEBUG false

# install certbot
RUN /bin/bash -c 'wget https://dl.eff.org/certbot-auto'
RUN /bin/bash -c 'mv certbot-auto /usr/local/bin'
RUN /bin/bash -c 'chmod a+x /usr/local/bin/certbot-auto'
RUN /bin/bash -c 'certbot-auto --noninteractive --os-packages-only'

COPY ./tmp/dwl/certbot.sh /tmp/dwl/certbot.sh
COPY ./tmp/dwl/init.sh /tmp/dwl/init.sh
