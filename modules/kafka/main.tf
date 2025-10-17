resource "helm_release" "kafka" {
  name       = "kafka"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "kafka"
  namespace  = var.namespace
  version    = "32.4.3"

  set = [
    {
      name  = "replicaCount"
      value = "3"
    },
    {
      name  = "persistence.enabled"
      value = "true"
    },
    {
      name  = "persistence.size"
      value = "20Gi"
    },
    {
      name  = "kraft.enabled"
      value = "true"
    },
    {
      name  = "auth.clientProtocol"
      value = "plaintext"
    },
    {
      name  = "service.type"
      value = "ClusterIP"
    }
  ]
}

