resource "helm_release" "redis" {
  name       = "redis"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"
  version    = "23.1.3"

  namespace = "tms"

  set = [
    {
      name  = "auth.enabled"
      value = "true"
    },
    {
      name  = "auth.password"
      value = "myStrongRedisPassword"
    },
    {
      name  = "architecture"
      value = "replication"
    },
    {
      name  = "master.persistence.enabled"
      value = "true"
    },
    {
      name  = "master.persistence.size"
      value = "8Gi"
    }
  ]
}
