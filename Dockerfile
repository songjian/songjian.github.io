FROM jekyll/jekyll

RUN gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ \
      --remove https://rubygems.org/ 
RUN gem install bundler:2.1.4
RUN bundle _2.1.4_ i

WORKDIR /srv/jekyll

COPY . .
EXPOSE 4000
CMD ["jekyll s -wD"]
