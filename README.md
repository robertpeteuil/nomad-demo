# nomad-demo

## Consul Agent Shell

``` sh
sudo consul agent -dev
```

## Nomad Agent Shell

``` sh
sudo nomad agent -dev
```

## Browser Tabs

Tab         | URL
------------|---------------
Consul      | localhost:8500
Nomad       | localhost:4646
Minesweeper | localhost:8080

## Nomad Job Shell

``` sh
nomad job run minesweeper-app.nomad
nomad job run minesweeper-api.nomad
```
