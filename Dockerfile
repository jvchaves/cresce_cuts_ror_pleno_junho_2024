# Use the official Ruby image with version 3.0.0
FROM ruby:3.0.0

# Install essential dependencies
RUN apt-get update -qq && apt-get install -y curl gnupg

# Install Node.js (version 18.x)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs postgresql-client

# Install Yarn using the official key and source list
RUN curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarn-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/yarn-archive-keyring.gpg] https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Set the working directory in the container
WORKDIR /app

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the application code to the container
COPY . .

# Remove package-lock.json to avoid conflicts with Yarn
RUN rm -f package-lock.json

# Install JavaScript dependencies using Yarn
RUN yarn install

# Remove the tmp folder if it exists
RUN rm -rf tmp

# Build assets
RUN bundle exec rails assets:precompile

# Expose port 3000 to the host
EXPOSE 3000

# Create database, run migrations, and load seeds
CMD ["bash", "-c", "bundle exec rails db:drop && bundle exec rails db:create && bundle exec rails db:migrate && bundle exec rails db:seed && rails server -b 0.0.0.0"]
