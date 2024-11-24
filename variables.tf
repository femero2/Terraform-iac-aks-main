variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "West US 2"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "aksResourceGroup"
}

variable "storage_account_name" {
  description = "The name of the Azure Storage Account"
  type        = string
  default     = "storageaccountpvb"
}

variable "container_name" {
  description = "The name of the container in the Azure Storage Account"
  type        = string
  default     = "containerpvb"
}
variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
  default     = "akspvb"
}

variable "node_vm_size" {
  description = "The size of the virtual machines in the AKS node pool"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "vnet_cidr" {
  description = "The CIDR block for the virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "service_cidr" {
  description = "The CIDR block for the Kubernetes service network"
  type        = string
  default     = "10.1.0.0/16"
}

variable "dns_service_ip" {
  description = "The IP address for the Kubernetes DNS service"
  type        = string
  default     = "10.1.0.10"
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
  default     = "acrpvb"
}