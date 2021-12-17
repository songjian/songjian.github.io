FROM songjian1984/jekyll

WORKDIR /srv/jekyll

COPY Gemfile* jekyll-yamt.gemspec ./

RUN bundle _2.1.4_ i

EXPOSE 4000
CMD ["jekyll", "s"]