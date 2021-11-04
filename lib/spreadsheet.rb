require 'google_drive'

class Spreadsheet
  def initialize(title:)
    session = GoogleDrive::Session.from_service_account_key('secrets/gcloud_client_secret_key.json')
    @self = session.spreadsheet_by_title(title)
  end

  def tab(title:)
    worksheet_data(title: title)
  end

  private
   attr_accessor :self

   def worksheet_data(title:)
     worksheet = @self.worksheet_by_title(title)
     titles = titles = worksheet.rows.first.map(&:to_sym)
     worksheet.rows(skip = 1).map{ |row| Hash[titles.zip(row)] }
   end
end
