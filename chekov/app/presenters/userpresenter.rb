
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
		"#{@user.last_name}, #{@user.first_name[0]}." if !@user.last_name.strip.empty?
		""
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
		return team[0,3] if team == 'DEVELOPMENT'
		return team[0,4] if team == 'PRODUCT'
		team
	end

	def role_name
		@user.role.name.titlecase
	end

	def permission_name
		@user.permission.name.titlecase
	end

	# method missing to delegate to @user or super
	def method_missing(name, *args)
		@user.send(name, *args)
		super
	end

end