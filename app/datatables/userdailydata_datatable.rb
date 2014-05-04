class UserdailydataDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view
  include ApplicationHelper
  include Rails.application.routes.url_helpers

  def initialize(view)
    @view = view
  end


  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Userdailydata.count,
      iTotalDisplayRecords: userdailydata.total_entries,
      aaData: data
    }
  end

private

  def data
    userdailydata.map do |datapoint|
      [
        h(datapoint.date),
        h(datapoint.calories_consumed),
        h(datapoint.calories_exercised),
        h(datapoint.weight)
      ]
    end
  end
  

  def userdailydata
    @userdailydata ||= fetch_userdailydata
  end

  def fetch_userdailydata
    userdailydata = Userdailydata.order("#{sort_column} #{sort_direction}")
    userdailydata = userdailydata.page(page).per_page(per_page)
    if params[:sSearch].present?
      userdailydata = userdailydata.where("date like :search", search: "%#{params[:sSearch]}%")
    end
    userdailydata
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[created_at]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" 
  end

end

