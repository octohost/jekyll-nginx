FROM octohost/ruby-2.0

RUN export LANGUAGE=en_US.UTF-8 && export LANG=en_US.UTF-8 && export LC_ALL=en_US.UTF-8 && locale-gen en_US.UTF-8 && dpkg-reconfigure locales
RUN add-apt-repository -y ppa:nginx/stable && apt-get update && apt-get -y install python2.7 nginx
RUN ln -s /usr/bin/python2.7 /usr/bin/python
RUN gem install pygments.rb jekyll --no-rdoc --no-ri

RUN mkdir /srv/www

WORKDIR /srv/www

ADD default /etc/nginx/sites-available/default
ADD nginx.conf /etc/nginx/nginx.conf