object false
node(:status) { "found" }
child @example do
	attributes :name, :description, :user, :project, :revision
end