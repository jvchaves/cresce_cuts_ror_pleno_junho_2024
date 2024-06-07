# Use the official Ruby image with version 3.0.0
FROM ruby:3.0.0

# Install essential dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory in the container
WORKDIR /app

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the application code to the container
COPY . .

# Expose port 3000 to the host
EXPOSE 3000

# Create database, run migrations, and load seeds
CMD ["bash", "-c", "bundle exec rails db:create && bundle exec rails db:migrate && bundle exec rails db:seed && rails server -b 0.0.0.0"]
