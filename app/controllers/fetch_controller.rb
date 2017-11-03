class FetchController < ApplicationController

  def ad()

    token = params[:token]

    project = Project.find_by_token(token)

    ad = Ad.offset(rand(Ad.count)).first

    data = open("http:" + ad.file.url)
    send_data data.read, filename: "imrsv_ad_#{token}.png", type: "image", disposition: 'attachment', stream: 'true', buffer_size: '4096'

    activity = AdActivity.new
    activity.project_id = project.id
    activity.ad_id = ad.id
    activity.save

  end

end
