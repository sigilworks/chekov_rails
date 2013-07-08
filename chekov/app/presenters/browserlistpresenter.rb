
class BrowserListPresenter

  def initialize
    @browsers = Browser.all
  end

  def by_groups
    @browsers.group_by do |b|
      if b.shortname.starts_with? 'CS' then 'Chrome/Safari'
      elsif b.shortname.starts_with? 'FF' then 'Firefox'
      elsif b.shortname.starts_with? 'ALL' then ''
      elsif b.shortname.starts_with? 'MSIE' then 'Internet Explorer'
      end
    end.sort_by { |group| group[0].length }
  end

  # method missing to delegate to @user or super
  def method_missing(name, *args)
    @browsers.send(name, *args)
  end

end
