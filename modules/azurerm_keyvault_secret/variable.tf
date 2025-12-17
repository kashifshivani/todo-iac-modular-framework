variable "kvsecs" {
    type = map(object({
      kv_name  = string
      rg_name = string
      secret_name  = string
      secret_value = optional(string)
    }))
  
}