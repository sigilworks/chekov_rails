
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
  def method_missing(method, *args, &block)
    @browsers.send(method, *args, &block)
  end

  # handling respond_to? alongside method_missing
  def respond_to?(method, include_private = false)
    method.in? self.public_methods(false) || super
  end

end
