resource "kubernetes_deployment" "tms_api" {
  metadata {
    name = "tms-api"
    labels = {
      app = "tms-api"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "tms-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "tms-api"
        }
      }

      spec {
        container {
          name  = "tms-api"
          image = "tms-api:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "tms_api" {
  metadata {
    name = "tms-api-service"
  }

  spec {
    selector = {
      app = "tms-api"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
