# Usa essa imagem para gerar nosso container
FROM ruby:2.3-slim
# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev imagemagick
# Seta nosso path
ENV APP_HOME /home/app/onebnb_api
# Cria nosso diretório
RUN mkdir -p $APP_HOME
RUN useradd -ms /bin/bash app
# Seta o nosso path como o diretório principal
WORKDIR $APP_HOME
# Copia o nosso Gemfile para dentro do container
ADD Gemfile $APP_HOME
ADD Gemfile.lock $APP_HOME
# Instala nossas Gems
RUN bundle install
# Copia nosso código para dentro do container
ADD . $APP_HOME
RUN chown -R app:app $APP_HOME
# Roda nosso servidor
EXPOSE 3000
CMD puma -C config/puma.rb


