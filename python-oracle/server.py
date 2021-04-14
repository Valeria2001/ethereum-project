from flask import Flask, abort
from flask import jsonify
from google.cloud import storage
from google.oauth2 import service_account
from PIL import Image
import os
import mimetypes
from web3 import Web3
 
w3 = Web3()
address = '0x1f9840a85d5aF5bf1D1762F925BDADdC4201F988' #contract address
abi = ''  #contract abi
contract_instance = w3.eth.contract(address=address, abi=abi)  #обьявляем обьект контракта

# update state:   tx_hash = contract_instance.functions.updateValue(43).transact( )

GOOGLE_STORAGE_PROJECT = os.environ['GOOGLE_STORAGE_PROJECT']
GOOGLE_STORAGE_BUCKET = os.environ['GOOGLE_STORAGE_BUCKET']

app = Flask(__name__)


########################################################################
# EXAMPLE  API  добавить обработку запросов от ск
########################################################################



######################################################################## 
# Routes
########################################################################

@app.route('/api/<token_id>')   ##  ОБРАЩЕНИЕ К TOKENID
def create(token_id):
      
    ## тут функция обращения к контракту по web3  и получения метадаты
    number_of_erc20 = contract_instance.functions.my_contract_number_erc20().call()
    tokenid_erc721 = contract_instance.functions.my_contract_token721_id().call()
  
    ##number_of_erc20 = аааа 
    return jsonify({
  	"description": "info of users tokens", 
  	"number of erc20":  number_of_erc20, 
  	"info of  erc721": tokenid_erc721,	
    })

# Error handling
@app.errorhandler(404)
def resource_not_found(e):
    return jsonify(error=str(e)), 404


########################################################################
# Main flow of execution
########################################################################

if __name__ == '__main__':
    app.run(debug=True, use_reloader=True)
