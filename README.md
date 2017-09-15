# Edeliver + Distillery + Docker Build & Deploy

In this example we:
- Execute edeliver commands in the container
- Build release on the same container (localhost)
- Deploy release to the same container (localhost)

It should be fairly easy to modify this example to Build or Deploy to a remote host.

Keep in mind this was done just for educational purposes.

## How to try it?

Build de image with:
```
$ docker build -t edeliver_distillery .
```

Build, Deploy and Start the app with:
```
$ docker run -it -p 8080:80 edeliver_distillery /bin/bash
```

Once it finishes, your application should be running and you should have a shell opened to start looking around.
 - `/var/src/app` contains the app's source code
 - `/var/www/app` contains the deployed release

And if you navigate to `localhost:8080` on your computer you should get: `Hello World! :)`

 Enjoy! :)
