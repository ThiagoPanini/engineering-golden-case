from typing import Any

from app.src.get_b3_active_tickers.infra.adapters.fundamentus_adapter import (
    FundamentusGetTickersAdapter
)

from app.src.get_b3_active_tickers.infra.repositories.dynamodb_repository import (
    DynamodbTickersInfoRepository
)

from app.src.get_b3_active_tickers.usecases.save_tickers_info_usecase import (
    SaveTickersInfoUseCase
)


# Definindo função handler
def handler(event: dict[str, Any], context: Any):
    adapter = FundamentusGetTickersAdapter()

    repository = DynamodbTickersInfoRepository(
        table_name="teste",
        region_name="teste"
    )

    use_case = SaveTickersInfoUseCase(adapter=adapter, repository=repository)
    use_case.execute()
