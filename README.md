# Ruby Application Deployment


### Docker command

Steps to build docker image

- cd `cd 01-Docker` 
- Run the below set of commands
  - `docker build --tag rubyapptest .`
  - `docker run -p 80:80 rubyapptest`
- Open `localhost:80` and `localhost:80/healthcheck` for validating the ruby application.
- This confirms that image is working fine.



### Future improvement 
- Use alphine ruby image to reduce the docker image size if required.