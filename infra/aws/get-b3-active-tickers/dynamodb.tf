/* --------------------------------------------------------
ARQUIVO: dynamodb.tf @ get-active-tickers module

Criação de um DynamoDB previamente configurado como um
recurso de armazenamento de itens obtidos através de
interface para coleta de informações de ativos financeiros
listados na B3.
-------------------------------------------------------- */
module "aws_dynamodb_table" {
  source = "git::https://github.com/ThiagoPanini/tf-modules-showcase.git?ref=aws/dynamodb-table/v0.1.0"

  name       = var.dynamodb_tickers_info_table_name
  hash_key   = var.dynamodb_tickers_info_table_hash_key
  range_key  = var.dynamodb_tickers_info_table_range_key
  attributes = var.dynamodb_tickers_info_table_attributes
}
