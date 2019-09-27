FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client xvfb libfontconfig wkhtmltopdf
RUN mkdir /herospark
WORKDIR /herospark

COPY Gemfile /herospark/Gemfile
COPY Gemfile.lock /herospark/Gemfile.lock

RUN bundle install --without production

COPY . /herospark

RUN chown -R 1000:1000 /herospark

EXPOSE 3000

CMD ["rake", 'db:create']
CMD ["rake", 'db:migrate']
CMD ["rake", 'db:seed']

CMD ["rails","server","-b","0.0.0.0"]
