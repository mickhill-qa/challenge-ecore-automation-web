# frozen_string_literal: true

class InvoiceDetailsPage < SitePrism::Page
  set_url "#{BASE_URL}/invoice"
  element :page_title, 'body header h2.mt-5'
  element :text_hotel_name, 'body section.content div h4'
  element :text_invoice_date, 'body section.content ul li:nth-child(1)'
  element :text_due_date, 'body section.content ul li:nth-child(2)'
  element :text_invoice_number, 'body section.content h6'
  element :text_booking_code, 'table:nth-child(8) tbody tr:nth-child(1) > td:nth-child(2)'
  element :text_customer_details, 'body section.content div div'
  element :text_room, 'table:nth-child(8) tbody tr:nth-child(2) > td:nth-child(2)'
  element :text_check_in, 'table:nth-child(8) tbody tr:nth-child(5) > td:nth-child(2)'
  element :text_check_out, 'table:nth-child(8) tbody tr:nth-child(6) > td:nth-child(2)'
  element :text_total_stay_count, 'table:nth-child(8) tbody tr:nth-child(3) > td:nth-child(2)'
  element :text_total_stay_amount, 'table:nth-child(8) tbody tr:nth-child(4) > td:nth-child(2)'
  element :text_deposit_now, 'table:nth-child(12) tbody tr td:nth-child(1)'
  element :text_tax_vat, 'table:nth-child(12) tbody tr td:nth-child(2)'
  element :text_total_amount, 'table:nth-child(12) tbody tr td:nth-child(3)'

  def initialize
    new_tab = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(new_tab)
  end

  def get_page_title
    page_title.text
  end

  def get_text_hotel_name
    text_hotel_name.text
  end

  def get_text_invoice_date
    str = text_invoice_date.text
    str = str.split(': ', 2)
    str[1]
  end

  def get_text_due_date
    str = text_due_date.text
    str = str.split(': ', 2)
    str[1]
  end

  def get_text_invoice_number
    str = text_invoice_number.text
    str = str.split(' ', 3)
    str[1].gsub('#','')
  end

  def get_text_booking_code
    text_booking_code.text
  end

  def get_text_customer_details
    str = text_customer_details.text
    str = str.gsub("\n",' ')
    str
  end

  def get_text_room
    text_room.text
  end

  def get_text_check_in
    text_check_in.text
  end

  def get_text_check_out
    text_check_out.text
  end

  def get_text_total_stay_count
    text_total_stay_count.text
  end

  def get_text_total_stay_amount
    text_total_stay_amount.text
  end

  def get_text_deposit_now
    str = text_deposit_now.text
    val = str.gsub('USD $','').to_f
    "USD $%0.02f" % val.round(2)
  end

  def get_text_tax_vat
    str = text_tax_vat.text
    val = str.gsub('USD $','').to_f
    "USD $%0.02f" % val.round(2)
  end

  def get_text_total_amount
    str = text_total_amount.text
    val = str.gsub('USD $','').to_f
    "USD $%0.02f" % val.round(2)
  end
end
