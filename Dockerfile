FROM ruby:3.2-alpine

# Create app directory
WORKDIR /app

# Copy files to directory
COPY ./ /app/

# Instalando pacotes
RUN gem install rspec simplecov simplecov-cobertura && bundle install

# Executando testes
RUN bundle exec rspec

# Iniciando CLI
ENTRYPOINT ["sh","Bench.sh"]