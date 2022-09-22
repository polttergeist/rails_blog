class SaveRequestsAndResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :request_handlers do |t|
      t.string :remote_ip
      t.string :request_method
      t.text :request_url
      t.string :response_status
      t.string :response_content_type

      t.timestamps
    end
  end
end
