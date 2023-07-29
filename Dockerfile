FROM ruby:2.6.6
RUN apt-get update -qq && apt-get install -y build-essential
WORKDIR /usr/src/app
COPY Gemfile* ./
RUN gem install bundler && bundle install
COPY ./ ./
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "3000"]