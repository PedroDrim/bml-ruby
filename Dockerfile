# Buil alpine
FROM alpine:3.14 AS build

# Create build directory
WORKDIR /build

# Copy files to directory
COPY ./data /build/

# Descompando arquivos de simulacao
RUN unzip simulationInput_M.zip -d .

FROM ruby:3.2-alpine

# Create app directory
WORKDIR /app

# Copy files to directory
COPY ./ /app/

# Instalando pacotes
RUN gem install rspec simplecov simplecov-cobertura && bundle install

# Executando testes
RUN bundle exec rspec

# Copiando tudo para deploy
COPY --from=build ./build /app/data

# Iniciando CLI
ENTRYPOINT ["sh","Bench.sh"]