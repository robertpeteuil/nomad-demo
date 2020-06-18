job "minesweeper-frontend" {
  datacenters = ["dc1"]
  type = "service"

  group "minesweeper-frontend" {
    count = 1

    task "frontend" {
      driver = "java"
      config {
        jar_path = "/Users/neil/src/github.com/dahlke/nomad-demo/spring-react-boilerplate-1.0.0-SNAPSHOT.jar"
      }

      resources {
          cpu    = 500
          memory = 300

          network {
            port "frontend" {
                static = 8080
            }
        }
      }

      service {
        name = "minesweeper-frontend"
        tags = ["global", "frontend"]
        port = "frontend"

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