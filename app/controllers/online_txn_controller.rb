class OnlineTxnController < ApplicationController

  def find_by_order
    render :status => :ok, :json => {
      "_links" => {
        "new" => {
          "href" => "http://127.0.0.1/orders/1/txns"
        }
      }
    }
  end
end
