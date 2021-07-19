FROM jekyll/jekyll

WORKDIR /srv/jekyll

COPY . .

RUN gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ \
      --remove https://rubygems.org/ 
RUN gem install bundler:2.1.4
RUN bundle _2.1.4_ i

EXPOSE 4000
CMD ["jekyll", "s", "-wD"]
