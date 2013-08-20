
class UserPresenter

  def initialize(user)
    @user = user
  end

  # John E. Smith
  def full_name
    "#{@user.first_name} #{@user.last_name}"
  end

  # Smith, J.
  def index_name
    return "<unassigned>" if !@user || @user.is_nobody?
    "#{@user.last_name}, #{@user.first_name[0]}."
  end

  # JS
  def initials
    "#{@user.first_name[0]}#{@user.last_name[0]}"
  end

  def team_name
    @user.team.name.titlecase
  end

  def team_abbrev
    team = @user.team.name
    return team[0, 3] if @user.team == Team.DEVELOPMENT
    return team[0, 4] if @user.team == Team.PRODUCT
    team
  end

  def role_name
    @user.role.name.titlecase
  end

  def permission_name
    @user.permission.name.titlecase
  end

  # method missing to delegate to @user or super
  def method_missing(method, *args, &block)
    @user.send(method, *args, &block)
  end
  # handling respond_to? alongside method_missing
  def respond_to?(method, include_private = false)
    method.in? self.public_methods(false) || super
  end

end