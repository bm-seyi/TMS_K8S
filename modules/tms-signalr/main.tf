resource "kubernetes_deployment" "tms_signalr" {
  metadata {
    name = "tms-signalr"
    namespace = var.namespace
    labels = {
      app = "tms-signalr"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "tms-signalr"
      }
    }

    template {
      metadata {
        labels = {
          app = "tms-signalr"
        }
      }

      spec {
        container {
          name  = "tms-signalr"
          image = "tms-signalr:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "tms_signalr" {
  metadata {
    name = "tms-signalr-service"
  }

  spec {
    selector = {
      app = "tms-signalr"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
