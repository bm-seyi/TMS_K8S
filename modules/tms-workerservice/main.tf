resource "kubernetes_deployment" "tms_workerservice" {
  metadata {
    name      = "tms-workerservice"
    namespace = var.namespace
    labels = {
      app = "tms-workerservice"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "tms-workerservice"
      }
    }

    template {
      metadata {
        labels = {
          app = "tms-workerservice"
        }
      }

      spec {
        container {
          name  = "tms-workerservice"
          image = "tms-workerservice:latest"
        }
      }
    }
  }
}