class StaticController < ApplicationController
#dont authenticate user before letting them see these pages
skip_before_action :authorize


def index
end


end