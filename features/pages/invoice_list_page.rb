# frozen_string_literal: true

class InvoiceListPage < SitePrism::Page
  set_url "#{BASE_URL}/account"
  element :page_title, 'body header h2.mt-5'

  def get_page_title
    page_title.text
  end
end