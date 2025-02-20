import boto3

from app.src.get_b3_active_tickers.domain.entities.ticker import Ticker
from app.src.get_b3_active_tickers.domain.interfaces.repositories_interface import (
    ITickersInfoRepository
)


class DynamodbTickersInfoRepository(ITickersInfoRepository):

    def __init__(self, table_name: str, region_name: str):
        self.__table_name: str = table_name
        self.__region_name: str = region_name
        self.__boto3_resource = boto3.resource("dynamodb", region_name=self.__region_name)
        self.__dynamodb_table = self.__boto3_resource.Table(self.__table_name)


    def persist(self, ticker: Ticker) -> None:
        _ = self.__dynamodb_table.put_item(Item=ticker.model_dump())
