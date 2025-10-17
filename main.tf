module "tms-api" {
  source = "./modules/tms-api"
}

module "tms-workerservice" {
  source = "./modules/tms-workerservice"
}

module "tms-signalr" {
  source = "./modules/tms-signalr"
}

module "redis" {
  source = "./modules/redis"
}