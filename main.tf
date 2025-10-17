resource "kubernetes_namespace_v1" "TMS" {
  metadata {
    name = "tms"
  }
}

module "tms-api" {
  source    = "./modules/tms-api"
  namespace = kubernetes_namespace_v1.TMS.metadata[0].name
}

module "tms-workerservice" {
  source    = "./modules/tms-workerservice"
  namespace = kubernetes_namespace_v1.TMS.metadata[0].name
}

module "tms-signalr" {
  source    = "./modules/tms-signalr"
  namespace = kubernetes_namespace_v1.TMS.metadata[0].name
}

module "redis" {
  source    = "./modules/redis"
  namespace = kubernetes_namespace_v1.TMS.metadata[0].name
}

module "kafka" {
  source    = "./modules/kafka"
  namespace = kubernetes_namespace_v1.TMS.metadata[0].name
}

module "debezium" {
  source    = "./modules/debezium"
  namespace = kubernetes_namespace_v1.TMS.metadata[0].name
}