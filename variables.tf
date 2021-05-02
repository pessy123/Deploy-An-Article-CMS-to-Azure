variable "location" {
  default = "westus2"
  description = "Location"
  type = string
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "Production"
    Team = "Udacity"
  }
}