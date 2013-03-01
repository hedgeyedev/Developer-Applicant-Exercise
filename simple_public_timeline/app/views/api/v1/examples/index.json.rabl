object false
node(:status) { "collected" }
child @examples => :examples do
	attributes :name, :description, :user, :project, :revision
end
