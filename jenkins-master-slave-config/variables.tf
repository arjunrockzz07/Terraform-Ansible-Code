variable "env" {
    description = "please enter the type of env dev or prod" /* if you want to choose which server u want we need to define this*/
   }
   variable "servername"{
    default = {
      "dev" = "dev-server"
      "prod" = "prod-Server"
    }
   }
   variable "keyname"{
    default = {
      "dev" = "test2"
      "prod" = "test2"
    }
   }
  variable "playbookname" {
  default = {
   "dev" = "arjun.yaml"
   "prod" = "arjun2.yaml"
  }
 }
