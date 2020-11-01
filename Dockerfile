FROM ruby:2.5.1

WORKDIR /ArcPost

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  postgresql-client \
  libpq-dev \
  nodejs \
  build-essential

COPY ./Gemfile /ArcPost/Gemfile
COPY ./Gemfile.lock /ArcPost/Gemfile.lock
RUN bundle install

CMD [ "rails", "s", "-b", "0.0.0.0"]
