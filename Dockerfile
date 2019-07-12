# Use an official Python runtime as a parent image
FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /ensemble

# Set the working directory to /app
WORKDIR /ensemble

COPY Gemfile /ensemble/Gemfile
COPY Gemfile.lock /ensemble/Gemfile.lock

RUN gem install bundler
RUN bundle install

# Copy the current directory contents into the container at /app
COPY . /ensemble

# Add a script to be executed every time the container starts.

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
# RUN bundle install
# RUN rake db:drop db:create db:migrate
ENTRYPOINT ["entrypoint.sh"]




# Make port 80 available to the world outside this container
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]