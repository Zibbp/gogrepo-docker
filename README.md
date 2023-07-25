# gogrepo-docker
Docker container for [gogrepo](https://github.com/eddie3/gogrepo)

## Usage

```bash
docker run -it --rm -v /path/to/your/storage/gogrepo:/srv zibbp/gogrepo-docker:latest command
```

Use a bash script to run all commands at once

```bash
#!/bin/bash
#echo "updating games"
#/gorepo/gorepo.py update -os windows linux -lang en
echo "updating known games"
/gogrepo/gogrepo.py update -os windows linux -lang en -skipknown
echo "updating games with 'updated' tag"
/gogrepo/gogrepo.py update -os windows linux -lang en -updateonly
echo "downloading games"
/gogrepo/gogrepo.py download
#echo "validating games"
#/gogrepo/gogrepo.py verify
```

```yaml
version: '3.3'
services:
  gogrepo:
    container_name: gogrepo
    image: ghcr.io/zibbp/gogrepo-docker:main
    volumes:
      - /path/to/games:/srv
      - /path/to/run.sh:/tmp/run.sh
    entrypoint: ["/bin/bash", "/tmp/run.sh"]
```
