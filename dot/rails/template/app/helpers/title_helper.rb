module TitleHelper
  def title_tag
    content_tag :title, @page_title || 'VarnaLab'
  end

  def title(title)
    @page_title ||= title
  end
end