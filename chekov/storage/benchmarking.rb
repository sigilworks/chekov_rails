require 'benchmark'

Status = Struct.new(:id, :name, :shortname, :description)
@statuses = [
  Status.new(id: 1, name: 'CLOSED', shortname: 'closed', description: 'Closed' ),
  Status.new(id: 2, name: 'OPEN', shortname: 'open', description: 'Open' ),
  Status.new(id: 3, name: 'NEW', shortname: 'new', description: 'New' ),
  Status.new(id: 4, name: 'URGENT', shortname: 'urgent', description: 'Urgent' ),
  Status.new(id: 5, name: 'REOPENED', shortname: 'reopened', description: 'Reopened' ),
  Status.new(id: 6, name: 'AWAITING_FEEDBACK', shortname: 'awaiting-feedback', description: 'Awaiting Feedback' ),
  Status.new(id: 7, name: 'CLOSED', shortname: 'closed', description: 'Closed' ),
  Status.new(id: 8, name: 'OPEN', shortname: 'open', description: 'Open' ),
  Status.new(id: 9, name: 'NEW', shortname: 'new', description: 'New' ),
  Status.new(id: 10, name: 'CLOSED', shortname: 'closed', description: 'Closed' ),
  Status.new(id: 11, name: 'CLOSED', shortname: 'closed', description: 'Closed' ),
  Status.new(id: 12, name: 'OPEN', shortname: 'open', description: 'Open' ),
  Status.new(id: 13, name: 'NEW', shortname: 'new', description: 'New' ),
  Status.new(id: 14, name: 'URGENT', shortname: 'urgent', description: 'Urgent' ),
  Status.new(id: 15, name: 'REOPENED', shortname: 'reopened', description: 'Reopened' ),
  Status.new(id: 16, name: 'AWAITING_FEEDBACK', shortname: 'awaiting-feedback', description: 'Awaiting Feedback' ),
  Status.new(id: 17, name: 'CLOSED', shortname: 'closed', description: 'Closed' ),
  Status.new(id: 18, name: 'OPEN', shortname: 'open', description: 'Open' ),
  Status.new(id: 19, name: 'NEW', shortname: 'new', description: 'New' ),
  Status.new(id: 20, name: 'NEW', shortname: 'new', description: 'New' )
]

n = 100000
Benchmark.bm do |x|
   x.report('&:map') { n.times do ; @status_ids = @statuses.map(&:id); end }
   x.report('inject') { n.times do ; @statuses.inject([]) {|w, a| w.push(a.id)}; end }
   x.report('collect') { n.times do ; @statuses.collect {|w| w.id }; end }
   x.report('map') { n.times do ; @status_ids = @statuses.map {|w| w.id }; end }
end

# round 1: 6 entities
        user       system     total      real
&:map   0.093000   0.000000   0.093000   (0.088005)
inject  0.156000   0.000000   0.156000   (0.165009)
collect 0.094000   0.000000   0.094000   (0.086005)
map     0.094000   0.000000   0.094000   (0.087005)

# round 2: 20 entities
        user       system     total      real
&:map   0.249000   0.000000   0.249000   (0.243013)
inject  0.500000   0.000000   0.500000   (0.502028)
collect 0.234000   0.000000   0.234000   (0.225013)
map     0.218000   0.000000   0.218000   (0.223013)