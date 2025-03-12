/* --------------------------------------------------------
ARQUIVO: dynamodb.tf @ get-b3-active-tickers module

Criação de um DynamoDB previamente configurado como um
recurso de armazenamento de itens obtidos através de
interface para coleta de informações de ativos financeiros
listados na B3.
-------------------------------------------------------- */

module "aws_dynamodb_table" {
  source = "git::https://github.com/ThiagoPanini/tf-modules-showcase.git?ref=aws/dynamodb-table/v0.1.1"

  name      = "tbl_egc_b3_active_tickers"
  hash_key  = "code"
  range_key = "dt_extracted"

  attributes = [
    {
      "name" : "code",
      "type" : "S"
    },
    {
      "name" : "dt_extracted",
      "type" : "S"
    }
  ]
}
