output "openai_cognitive_account_id" {
    value = azurerm_cognitive_account.this.id
    description = "value of the OpenAI cognitive account id"
}