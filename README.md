# rpdd

Demonstrates building a package, then building a Docker image that uses that package.

Install the R package:

```r
remotes::install_github("stephenturner/rpdd")
```

Build the Docker image:

```sh
./build.sh
```

This builds the package source tar.gz, moves that to the `docker/` directory, then builds the container from that directory. 

Run the Docker container to reverse transcribe a DNA sequence (GATTACAATTAC): 

```sh
docker run --rm rpdd
```

Output should be GTAATTGTAATC.
