variable "subscription_id" {
    description = "ID de la suscripción de Azure"
    type        = string
}

variable "project"{
    type = string
    description = "Nombre proyecto"
    default = "pokequeue"
}

variable "location"{
    type = string
    description = "Locación del despliegue de recursos en azure"
    default = "Central US"
}

variable "environment"{
    type = string
    description = "Entorno de despliegue"
    default = "dev"
}

variable "tags"{
    description = "Etiquetas de los recursos"
    type = map(string)
    default = {
        environment = "development"
        date = "abril-2025"
        createdBy = "Terraform"
    }
}

variable "admin_sql_password"{
    type = string
    description = "Te Password for the connect to database"
}