[![Stories in Ready](https://badge.waffle.io/progtologist/docker-openproject.png?label=ready&title=Ready)](https://waffle.io/progtologist/docker-openproject)
# OpenProject Dockerfile

A Dockerfile that builds [OpenProject][openproject], a free and open source software for project management with a wide set of features and plugins and an active community.

Comes with Vagrantfile for local testing; just use `vagrant up --no-parallel`.

## Basic usage

This is currently relying on a linked database container.  Here's an example usage (including data-only container):

```
docker run -d --name openproject-postgres-data -v /data busybox true
docker run -d --name openproject-postgres --volumes-from openproject-postgres-data -e USER=super -e PASS=password paintedfox/postgresql
docker run -d --name openproject --link openproject-postgres:postgres -p 8080:80 -e GMAIL_USERNAME=test@gmail.com -e GMAIL_PASSWORD=password progtologist/openproject
```

Wait a little while for the database setup and migrations to run.  After a short period the application should be available at http://localhost:8080.  You can check the database migration progress with `docker attach --sig-proxy=false openproject`.

You can use the GMAIL\_USERNAME and GMAIL\_PASSWORD parameters to enable using gmail smtp to send emails. To use this you must enable your accounts security settings to "Allow less secure apps".

## License

MIT license.

[openproject]: https://www.openproject.org/
