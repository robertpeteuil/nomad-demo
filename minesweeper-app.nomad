job "minesweeper-app" {
  datacenters = ["dc1"]
  type = "service"

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