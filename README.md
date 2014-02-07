jekyll-nginx
===============

A base container to serve Jekyll content using Nginx. Saves memory and deploy time.

You don't need to use Jekyll to serve your site - you can just compile the files and use anything - `jekyll build`

This is a container that has Ruby, Python 2.7 and Jekyll available, to compile and build the static site, that nginx serves.

You can use our container: `docker pull octohost/jekyll-nginx`

Or you can build your own:

```
docker build -t your-name-here/jekyll-nginx .
docker push your-name-here/jekyll-nginx
```

After this - just add this Dockerfile to your Harp repo:

```
FROM octohost/jekyll-nginx

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

WORKDIR /srv/www

ADD . /srv/www/
RUN jekyll build

EXPOSE 80

CMD nginx
```

Push it to your docker server - and your server will use 4-6MB of RAM instead of 60MB.

To see an example working repo, [take a look here](https://github.com/octohost/jekyll).
