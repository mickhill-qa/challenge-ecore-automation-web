# frozen_string_literal: true

# @invoice_details_baseflow
Given('to click the Invoice Details link for the first item presented in the screen') do
  @page_invoice_list.open_invoice_from_list
end

When('the application show the page Invoice Details') do
  @page_invoice_details = InvoiceDetailsPage.new
  expect(page.current_url).to include(@page_invoice_details.url)
  expect('Invoice Details').to eql(@page_invoice_details.get_page_title)
  screenshot
end

And('validation the Hotel Name: {string}') do |hotel_name|
  expect(hotel_name).to eql(@page_invoice_details.get_text_hotel_name)
end

And('validation the Invoice Date: {string}') do |invoice_date|
  expect(invoice_date).to eql(@page_invoice_details.get_text_invoice_date)
end

And('validation the Due Date: {string}') do |due_date|
  expect(due_date).to eql(@page_invoice_details.get_text_due_date)
end

And('validation the Invoice Number: {string}') do |invoice_number|
  expect(invoice_number).to eql(@page_invoice_details.get_text_invoice_number)
end

And('validation the Booking Code: {string}') do |booking_code|
  expect(booking_code).to eql(@page_invoice_details.get_text_booking_code)
end

And('validation the Customer Details: {string}') do |customer_details|
  expect(customer_details).to eql(@page_invoice_details.get_text_customer_details)
end

And('validation the Room:{string}') do |room|
  expect(room).to eql(@page_invoice_details.get_text_room)
end

And('validation the Check In: {string}') do |check_in|
  expect(check_in).to eql(@page_invoice_details.get_text_check_in)
end

And('validation the Check Out: {string}') do |check_out|
  expect(check_out).to eql(@page_invoice_details.get_text_check_out)
end

And('validation the Total Stay Count: {string}') do |total_stay_count|
  expect(total_stay_count).to eql(@page_invoice_details.get_text_total_stay_count)
end

And('validation the Total Stay Amount: {string}') do |total_stay_amount|
  expect(total_stay_amount).to eql(@page_invoice_details.get_text_total_stay_amount)
end

And('validation the Deposit Now: {string}') do |deposit_now|
  expect(deposit_now).to eql(@page_invoice_details.get_text_deposit_now)
end

And('validation the Tax&VAT: {string}') do |tax_vat|
  expect(tax_vat).to eql(@page_invoice_details.get_text_tax_vat)
end

And('validation the Total Amount: {string}') do |total_amount|
  expect(total_amount).to eql(@page_invoice_details.get_text_total_amount)
end
