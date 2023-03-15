FROM ruby:3.0

WORKDIR /app

EXPOSE 4000

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["jekyll", "s", "-H", "0.0.0.0"]