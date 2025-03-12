/* --------------------------------------------------------
ARQUIVO: iam.tf @ get-b3-active-tickers module

Criação de policies e roles IAM necessárias para concessão
de privilégios e acessos para recursos instanciados em
ambiente AWS com o objetivo de coletar informações de
ativos financeiros listados na B3.
-------------------------------------------------------- */

module "aws_iam_role" {
  source = "git::https://github.com/ThiagoPanini/tf-modules-showcase.git?ref=aws/iam-role/v0.1.0"

  role_name                   = "egc-role-get-b3-active-tickers"
  trust_policy_filepath       = "${path.module}/assets/iam/trust_policies/trust-lambda.json"
  policy_templates_source_dir = "${path.module}/assets/iam/policy_templates"

  policy_templates_vars = {
    "region_name" = local.region_name,
    "account_id"  = local.account_id,
    "table_name"  = "tbl_egc_b3_active_tickers"
  }

}
