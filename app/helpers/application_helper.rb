# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def form_row(&block)
    content = capture(&block)
#    concat(content,block.binding)
    concat(content_tag_string('p', capture(&block), nil), block.binding)
  end


  def pretty_time(t)
    t.strftime("%d. %m. %Y %H:%M:%S")
  end

  def payment_desc(order, settings)
    case order.payment_type
      when 'bank_transfer'
        "Platba proběhně posláním částky na účet #{settings.bank_account_number} (#{settings.bank_account_title}). Variabilní symbol: #{order.created_at.year.to_s + order.id.to_s}"
      when 'cash'
        "Částka bude zaplacena hotově na kontaktní adrese"
      else
        "Chyba aplikace! Neznámý způsob platby."
    end
  end

  def shipment_desc(order, settings)
    case order.shipment_type 
      when 'ceska_posta'
        "Zboží bude zaslánou Českou poštou s poštovným #{order.shipment_price},-"
      when 'vyzvednuti'
        "Zboží si zákazník osobně vyzvedne na kontaktní adrese."
      else
        "Chyba aplikace! Neznámý způsob dodání."
    end
  end

end
