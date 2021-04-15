FROM ruby:2.7.2

RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends nodejs

WORKDIR /opt/monitoria_cic

COPY Gemfile Gemfile.lock ./

RUN bundle install

EXPOSE ${PORT:-3000}

CMD rails server -p ${PORT:-3000} -b "0.0.0.0"