variable "namespace" {
  nullable = false
  type     = string
}

variable "password" {
  nullable  = false
  type      = string
  sensitive = true
}