# frozen_string_literal: true

class InvoiceListPage < SitePrism::Page
  set_url "#{BASE_URL}/account"
  element :page_title, 'body header h2.mt-5'
  elements :list_invoice, 'body div.row a'

  def get_page_title
    page_title.text
  end

  def open_invoice_from_list(index = 0)
    list_invoice[index].click
  end
end
