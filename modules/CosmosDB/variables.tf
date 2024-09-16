variable "location" {
    type    = string
    default = "westus"
}

variable "name" {
    type    = string
    default = "kmblkcosmostest"
}

variable "offer_type" {
    type    = string
    default = "Standard"
}

variable "resource_group_name" {
    type    = string
    default = "blktest"
}

variable "tags" {
    type    = map(string)
    default = {
        tagName = "GAIA-KM"
    }
}

variable "consistency_level" {
    type    = string
    default = "Session"
}

variable "failover_priority" {
    type    = number
    default = 0
}

variable "identity_type" {
    type    = string
    default = "SystemAssigned"
}

variable "account_name" {
    type    = string
    default = "kmblkcosmostest"
}

variable "database_name" {
    type    = string
    default = "GAIA"
}

variable "container_name" {
    type    = string
    default = "ChatHistories"
}

variable "container_name2" {
    type    = string
    default = "ChatHistories"
}

variable "partition_key_path" {
    type    = string
    default = "/partitionKey"
}

variable "principal_id" {
    type    = string
    default = "8295c3e0-9d08-4a85-abab-f3b7815092fb"
}

variable "role_definition_id" {
    type    = string
    default = "/subscriptions/b7840bca-7b37-44a4-ac7e-f0568c1d3d85/resourceGroups/blktest/providers/Microsoft.DocumentDB/databaseAccounts/kmblkcosmostest/sqlRoleDefinitions/00000000-0000-0000-0000-000000000002"
}

variable "scope" {
    type    = string
    default = "/subscriptions/b7840bca-7b37-44a4-ac7e-f0568c1d3d85/resourceGroups/blktest/providers/Microsoft.DocumentDB/databaseAccounts/kmblkcosmostest"
}

variable "assignable_scopes" {
    type    = list(string)
    default = ["/subscriptions/b7840bca-7b37-44a4-ac7e-f0568c1d3d85/resourceGroups/blktest/providers/Microsoft.DocumentDB/databaseAccounts/kmblkcosmostest"]
}

variable "role_name_reader" {
    type    = string
    default = "Cosmos DB Built-in Data Reader"
}

variable "role_name_contributor" {
    type    = string
    default = "Cosmos DB Built-in Data Contributor"
}

variable "data_actions_reader" {
    type    = list(string)
    default = ["Microsoft.DocumentDB/databaseAccounts/readMetadata", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/executeQuery", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/read", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/readChangeFeed"]
}

variable "data_actions_contributor" {
    type    = list(string)
    default = ["Microsoft.DocumentDB/databaseAccounts/readMetadata", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/*", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/*"]
}