# nomad-demo

```
# Get the .jar file into this repo
cp ../spring-react-boilerplate/target/spring-react-boilerplate-1.0.0-SNAPSHOT.jar .
```

```
sudo nomad agent -dev

nomad job run minesweeper-frontend.nomad
nomad job run minesweeper-api.nomad
```
