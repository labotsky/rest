class Post < ActiveRecord::Base
	validates :title, length: { minimum: 5 }
	validates :title, presence: true
	mount_uploader :image, ImageUploader

	after_commit :websocket

	def websocket
	    ws = WebSocket::Client::Simple.connect 'ws://localhost:8080'
		ws.on :message do |msg|
		  puts msg.data
		end
		ws.on :open do
		  ws.send "{\"post\":{\"id\":\"#{self.id}\"}"
		  ws.close
		end
	end

end
