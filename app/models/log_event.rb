class LogEvent < ActiveRecord::Base

   belongs_to :target, polymorphic: true

  def  self.log(user_id, target, action)
    if target.persisted?
                 create(user_id: user_id,
                            target_id: target.id,
                            target_type: target.class.to_s,
                            action: action)
      end
    end


end
