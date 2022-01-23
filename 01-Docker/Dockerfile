# DockerFile to create image for http_server.rb
FROM ruby:alpine3.15

#Using nobody user as per shared requirements
USER nobody

# Assuming /user/src/app is folder structure during development it can also be /app
WORKDIR /app
ADD . /app
EXPOSE 80
CMD ["ruby", "http_server.rb"]