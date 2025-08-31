# Use an official Ruby image
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set working directory
WORKDIR /app

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the app
COPY . .

# Expose Rails server port
EXPOSE 3000

# Default command
CMD ["bin/rails", "server", "-b", "0.0.0.0"]