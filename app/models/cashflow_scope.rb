class CashflowScope
  attr_reader :date_to, :date_from

  def initialize(params)
    params ||= {}
    @date_from = parsed_date(params[:date_from], Date.today.beginning_of_year.to_s)
    @date_to = parsed_date(params[:date_to], Date.today.advance(:months => 1).to_s)
  end

  def scope
    Transaction.where('date BETWEEN ? AND ?', @date_from, @date_to )
  end

  private

  def parsed_date(date_string, default)
    Date.parse(date_string)
  rescue ArgumentError, TypeError
    default
  end
end
