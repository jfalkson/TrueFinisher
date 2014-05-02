class userDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end


      t.integer :calories_consumed
      t.integer :calories_exercised
      t.datetime :date
      t.integer :weight


  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Userdailydata.count,
      iTotalDisplayRecords: Userdailydata.total_entries,
      aaData: data
    }
  end

private

  def data
    Userdailydata.map do |data|
      [
        h(data.date),
        h(data.calories_consumed),
        h(data.calories_exercised),
        h(data.weight)
      ]
    end
  end

  def userData
    @userData ||= fetch_Userdailydata
  end

  def fetch_Userdailydata
    userDatauserData = Userdailydata.order("#{sort_column} #{sort_direction}")
    userData = userData.page(page).per_page(per_page)
    if params[:sSearch].present?
      userData = userData.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    userData
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end