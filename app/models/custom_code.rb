class CustomCode < ActiveRecord::Base
  belongs_to :deal
  attr_accessible :code, :consumed, :deal_id

   before_save :set_code_length

   private

   def set_code_length
   	@temp = self.code.size
   	@size = 12 - @temp
   	self.code = "0".to_s.rjust(@size, "0") + self.code.to_s
   end
end
