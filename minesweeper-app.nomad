job "minesweeper-app" {
  datacenters = ["dc1"]
  type        = "service"

  group "minesweeper-app" {
    count = 1

    task "app" {
      driver = "java"
      config {
        jar_path = "/Users/robertpeteuil/Versioned/prod/nomad/nomad-demo/minesweeper-app-1.0.0-SNAPSHOT.jar"
      }

      resources {
        cpu    = 500
        memory = 500

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
          timeout  = "5s"
        }
      }
    }
  }
}
