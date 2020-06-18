job "minesweeper-api" {

  datacenters = ["dc1"]
  type = "service"

  update {
    max_parallel = 1
    min_healthy_time = "10s"
    healthy_deadline = "3m"
    progress_deadline = "10m"
    auto_revert = false
    canary = 0
  }

  migrate {
    max_parallel = 1
    health_check = "checks"
    min_healthy_time = "10s"
    healthy_deadline = "5m"
  }

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
}
