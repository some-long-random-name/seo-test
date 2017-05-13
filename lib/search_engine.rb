class SearchEngine
  attr_reader :query

  def initialize(query)
    @query = query
  end

  def results
    ["Primary result for '#{query}'"] +
      9.times.map { |n| "Result #{n + 2}" }
  end
end
