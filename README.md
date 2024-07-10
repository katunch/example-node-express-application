example-node-express-application
================================

This is just an example application written in Javascript. It showcases application code, its dependencies and how to build using Docker using multistage builds. 

# Build
To build a Docker image just run 
```bash
docker build -t example-node-express-application .
```

# Run
To run the application after you build the Docker image just run
```bash
docker run --rm -p 3000:3000 example-node-express-application:latest
```

Then open [http://localhost:3000](http://localhost:3000).