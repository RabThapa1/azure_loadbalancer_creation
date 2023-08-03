variable "region" {
    description = "location of the resource"
    type = string
    default = "australiaeast"
}

variable "tags" {
    description = "Environments"
    type = map(string)
    default = {
        environment = "dev"
        owner = "SRE"
        EmailAddress = "sreteam@tinfosolution.co.nz"

    }
}

variable "sku" {
   description = "Defines sky for public IP address as well as Load balancer" 
   type = string
   default = "Standard"


}
