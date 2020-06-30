job "minesweeper" {

  datacenters = ["dc1"]
  type = "service"

  group "minesweeper-api" {
    count = 1

    restart {
      attempts = 2
      interval = "30m"
      delay = "15s"
      mode = "fail"
    }

    ephemeral_disk {
      size = 300
    }

    task "api" {
      driver = "docker"

      config {
        image = "eklhad/minesweeper:latest"
        
        port_map {
          api = 3000
        }
      }

      resources {
        network {
          mbits = 10
          port  "api"  {
              static = 3000
          }
        }
      }

      service {
        name = "minesweeper-api"
        tags = ["global", "api"]
        port = "api"

        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }

  group "minesweeper-app" {
    count = 1

    task "app" {
      driver = "java"
      config {
        jar_path = "/Users/neil/src/github.com/dahlke/nomad-demo/minesweeper-app-1.0.0-SNAPSHOT.jar"
      }

      resources {
          cpu    = 500
          memory = 300

          network {
            port "app" {
                static = 8080
            }
        }
      }

      service {
        name = "minesweeper-app"
        tags = ["global", "app"]
        port = "app"

        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }

  }
}
