FROM ruby:2.3.3

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        mysql-client \
        nodejs \
        netcat \
    && rm -rf /var/lib/apt/lists/*

RUN gem install rack
RUN gem install facebook-messenger
RUN gem install dotenv
RUN gem install rerun

WORKDIR /usr/src/app

COPY . .

EXPOSE 3000

CMD ["rerun", "rackup -p 3000 -o 0.0.0.0"]
