# gocyclo container image

This container image contains following components:

* gocyclo: <https://github.com/fzipp/gocyclo>

## USAGE

```bash
docker pull hidori/gocyclo:latest
```

## EXAMPLE

```bash
docker run --rm -w $PWD -v $PWD:$PWD hidori/gocyclo -top 30 .
```
