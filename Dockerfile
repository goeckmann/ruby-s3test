FROM ruby:3.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir /usr/local/share/ca-certificates/juniper-firewall
COPY internet-ca.crt /usr/local/share/ca-certificates/juniper-firewall
RUN update-ca-certificates

WORKDIR /usr/src/app

RUN gem install aws-sdk
RUN gem install openssl

COPY *.rb ./

CMD ["./sleep.rb"]
