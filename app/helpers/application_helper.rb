module ApplicationHelper
  def highlighter(path)
    current_page?(path) ? "text-white bg-green-500 font-semibold" : ""
  end
end
