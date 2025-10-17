resource "helm_release" "debezium" {
  name       = "debezium-operator"
  repository = "https://charts.debezium.io"
  chart      = "debezium"
  namespace  = "tms"
  version    = "3.3.1"
}

