class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def state_human
    case state
    when 'new'
      state_human = 'Nová'
    when 'finished'
      state_human = 'Dokončená'
    else
      state_human = 'Neznámý typ'
    end
    state_human
  end
  
  def shipment_type_human
    case shipment_type 
      when 'ceska_posta'
        "Česká pošta"
      when 'vyzvednuti'
        "Osobní vyzvednutí."
      else
        "Chyba aplikace! Neznámý způsob dodání."
    end
  end

  def payment_type_human
    case payment_type
      when 'bank_transfer'
        "Převodem na účet. "
      when 'cash'
        "Hotově"
      else
        "Chyba aplikace! Neznámý způsob platby."
    end
  end
  
  def items_total_price
    order_items.sum('quantity * price')
  end
end
