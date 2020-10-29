FROM ruby:2.5.1

WORKDIR /ArcPost

COPY ./Gemfile /ArcPost/Gemfile
COPY ./Gemfile.lock /ArcPost/Gemfile.lock
RUN bundle install

CMD [ "rails", "s", "-b", "0.0.0.0"]
