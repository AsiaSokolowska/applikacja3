class LogEventsController < ApplicationController

def index
@logevents = LogEvent.all
end



end
