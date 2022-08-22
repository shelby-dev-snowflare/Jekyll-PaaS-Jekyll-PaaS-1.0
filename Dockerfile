FROM ubuntu

ADD jekyll /usr/local/bin/jekyll
ADD caddy /usr/local/bin/caddy

ADD start.sh /start.sh

RUN mkdir /jekyll
RUN chmod +x /start.sh
RUN chmod +x /usr/local/bin/jekyll
RUN chmod +x /usr/local/bin/caddy

#CMD /start.sh

ENTRYPOINT ["sh", "-c", "/start.sh"]
