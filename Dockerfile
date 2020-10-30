FROM ruby:2.5.1

WORKDIR /ArcPost

RUN apt-get update
RUN apt-get install -y postgresql-client
RUN apt-get install -y libpq-dev


COPY ./Gemfile /ArcPost/Gemfile
COPY ./Gemfile.lock /ArcPost/Gemfile.lock
RUN bundle install

CMD [ "rails", "s", "-b", "0.0.0.0"]
